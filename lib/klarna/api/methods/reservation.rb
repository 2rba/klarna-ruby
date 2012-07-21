# encoding: utf-8

module Klarna
  module API
    module Methods
      module Reservation

        # Reserve a purchase amount for a specific customer. The reservation is valid, by default, for 7 days.
        # Pass cellphone no. instead of Pno for SMS payments.
        #
        def reserve_amount(pno, amount, order_id, delivery_address, billing_address, client_ip, currency_code,
                           country_code, language_code, pno_encoding, pclass, goods_list,
                           shipmentinfo = '', reference = '', reference_code = '', comment = '', travelinfo ='', bankinfo = '', gender = '',
                           session_id = [], extra_info = [], annual_salary = nil, flags = 0)
          params = [
            pno,
            gender,
            amount,
            reference,
            reference_code,
            order_id,
            order_id,
            delivery_address,
            billing_address,
            client_ip,
            flags,
            currency_code,
            country_code,
            language_code,
            self.store_id,
            self.digest(pno, amount),
            pno_encoding,
            (pclass || ::Klarna::API::DEFAULTS[:PCLASS]),
            goods_list,
            comment,
            shipmentinfo,
            travelinfo,
            [(annual_salary || ::Klarna::API::DEFAULTS[:YSALARY])],
            bankinfo,
            session_id,
            extra_info
          ]
          
          self.call(:reserve_amount, *params).tap do |result|
            result = result.first
          end
        end

        # Activate purchases which have been previously reserved with the reserve_amount function.
        #
        def activate_reservation(reservation_id, pno, ocr, goods_list, reference, reference_code, order_id_1, order_id_2,
                                 client_ip, shipping_address, invoicing_address, shipment_type, email, phone, cell_phone,
                                 currency_code, country_code, language_code, pno_encoding, pclass, annual_salary = nil, flags = nil)
          # params = [
          #   reservation_id,
          #   pno,
          #   (ocr || KRED_DEFAULT_OCR),
          #   goods_list,
          #   reference,
          #   reference_code,
          #   order_id_1,
          #   order_id_2,
          #   shipping_address,
          #   invoicing_address,
          #   shipment_type,
          #   email,
          #   phone,
          #   cell_phone,
          #   client_ip,
          #   flags,
          #   currency_code,
          #   country_code,
          #   language_code,
          #   self.store_id,
          #   self.digest(pno, goods_list),
          #   pno_encoding,
          #   (pclass || KRED_DEFAULT_PCLASS),
          #   (annual_salary || KRED_DEFAULT_YSALARY)
          # ]
          # self.call(:activate_reservation, *params)
          raise NotImplementedError
        end

        # Cancel a reservation.
        #
        def cancel_reservation(reservation_id)
          # params = [
          #   reservation_id,
          #   self.store_id,
          #   self.digest(reservation_id)
          # ]
          # self.call(:cancel_reservation, *params)
          raise NotImplementedError
        end

        # Split a reservation due to for example outstanding articles.
        #
        def split_reservation(reservation_id, split_amount, order_id_1, order_id_2, flags = nil)
          # params = [
          #   reservation_id,
          #   split_amount,
          #   order_id_1,
          #   order_id_2,
          #   flags.to_i,
          #   self.store_id,
          #   self.digest(reservation_id, split_amount)
          # ]
          # self.call(:split_reservation, *params)
          raise NotImplementedError
        end

        # Change a reservation.
        #
        def change_reservation(reservation_id, new_amount, flags = 0)
          params = [
            reservation_id,
            new_amount,
            self.store_id,
            self.digest(reservation_id, new_amount),
            flags
          ]
          self.call(:change_reservation, *params).tap do |result|
            result = result.first
          end
        end

        # Reserves one or more OCR numbers for your store.
        #
        def reserve_ocr_numbers(number_of_ocrs)
          # params = [
          #   number_of_ocrs,
          #   self.store_id,
          #   self.digest(number_of_ocrs)
          # ]
          # self.call(:reserve_ocr_nums, *params)
          raise NotImplementedError
        end

        # Create addresses for arguments such as the +activate_reservation+ function.
        #
        def make_reservation_address(first_name, last_name, street_address, zip, city, country_code, house_number = '')
          {
            :fname        => first_name,
            :lname        => last_name,
            :street       => street_address,
            :zip          => zip,
            :city         => city,
            :country      => ::Klarna::API.id_for(:country, country_code),
            :house_number => house_number
          }.with_indifferent_access
        end
        alias :mk_reservation_address :make_reservation_address

      end
    end
  end
end
