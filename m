Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEDF3156A9
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Feb 2021 20:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705556E09A;
	Tue,  9 Feb 2021 19:22:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351436E09A
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Feb 2021 19:22:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p21so30069291lfu.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 09 Feb 2021 11:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c7XimrMWBYfaeW7Cp3jKo/Gu8AZagGCyLJzPBEGorLE=;
 b=FJkpy7eh7BeVjEJza9So+soZk+WyWnIehZ/GOpVf9/vwtJYi0N2qzS33Wnq1MK1deb
 LUZ6I9wJPDhyxUVuF030HKxBm7nv4o1VzMTdyT8c/lQXseZ+jXJbRVGAO/Fjl6nkEkxd
 HIfWbUpO5iFvk2+WQYadUBV98wPYsQUZlDvicS2yPzCdpOs33fLrxXNg/Pr5+X4U4ODN
 XRbhrIV0OXREkavzXVZfhlIy60Lk/EHMkdgUOwCsmA3Faq7UxAVkBlqEuQfZ3TjkPmlN
 buWvzALwQfGdrVILdypEdaQLhX0rbVbZJOFqzLXV569ygWBTnmiSjrChhQJihFrWYXm4
 U/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c7XimrMWBYfaeW7Cp3jKo/Gu8AZagGCyLJzPBEGorLE=;
 b=lixXQbynY8N2diUar+gpZtRUfqvnqRq3WOv4oIDXg5n58dRlu2M03cwFRKq/QB694D
 /zEwHw6o1lLNN4m8134+AQ/LG9zYH+FylGHtljpuV80M66bsHvPvMV1u6C8ZyIKrQOX8
 Pl0uy7MKgqvAglXJCxzzg9J2tmVcRyqHi2pJRDLHvBwfyEEbcWlFoCIoM9h4eHTrkDb5
 ns2t/+Xx2HCTbxw5eTV/Cln001ACZxrSQJ8ONZ5cPGlsXoyAkzfHGlGL1ZaBS6CKVr7Z
 bdJSEK7iOhpA3y22x4ehk2OB8Koqp99ThVKnvdh+ZtuGcwNNlMlTIbTcQFwmUsBYYaNz
 XILg==
X-Gm-Message-State: AOAM532DS9vbaQmNtiJEJGYz/Vn3iXzHDsH/3d6UJOvxC5Wd/B2ESA7d
 A7z/j/fnt9KQI2+1X5KKPISL/IMCVLMX7q6YxShsFaKA8Qq6kg==
X-Google-Smtp-Source: ABdhPJzlWC3Gpwa2y/8saAcAbC7UBsIDTQqsZB5vXhyryqVKC5GyVdfCqmZfTdbhAxzlpr/hTdgBi3atp4jB7iz+Uwk=
X-Received: by 2002:a05:6512:3094:: with SMTP id
 z20mr14732262lfd.441.1612898546343; 
 Tue, 09 Feb 2021 11:22:26 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNazWZQGfSnFgQ_K5_H9uBQ=8gBdFORXrU1FEMGMohO2w@mail.gmail.com>
 <4ce29a7e-f58a-aeb4-bef-34a7eada70d0@google.com>
 <e0c2c823-5f-efe8-cd87-6dd6cc33a33@google.com>
 <7a677c89-1974-0676-ba7d-b057ad2cab3f@gmail.com>
 <CABXGCsPnGVAGWETYD-dfrqxhciHA0NKBG2EWueOtFzL5xF9z3g@mail.gmail.com>
 <cf60a50d-d3ca-2ce9-918b-0763a26552d8@gmail.com>
In-Reply-To: <cf60a50d-d3ca-2ce9-918b-0763a26552d8@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 10 Feb 2021 00:22:14 +0500
Message-ID: <CABXGCsP-ys+bMCYo0QZCcW-fERU6JCGTBAr_H7_ejcWntL26ZA@mail.gmail.com>
Subject: Re: [bug] 5.11-rc5 brought page allocation failure issue [ttm][amdgpu]
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCA4IEZlYiAyMDIxIGF0IDE0OjE4LCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBcmUgdGhlIG90aGVyIHByb2JsZW1z
IGdvbmUgYXMgd2VsbD8KPgoKQW5kIHllcyBhbmQgbm8uClRoZSBpc3N1ZSB3aXRoIG1vbml0b3Ig
dHVybnMgb2ZmIHdhcyBnb25lIGFmdGVyIHJjNiAoZ2l0M2FhZjBhMjdmZmMyKQpCdXQgYm90aCB0
cmFjZXMKMSkgQlVHOiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBpbnZhbGlkIGNvbnRl
eHQgYXQKaW5jbHVkZS9saW51eC9zY2hlZC9tbS5oOjE5NiAoa2VybmVsIDUuMTEgc3BlY2lmaWMp
CjIpIFdBUk5JTkc6IENQVTogMTQgUElEOiA1MDQgYXQga2VybmVsL2xvY2tpbmcvbG9ja2RlcC5j
OjQ2MTgKbG9ja2RlcF9pbml0X21hcF93YWl0cysweDE4Yi8weDIxMCAoTmF2aSBzcGVjaWZpYykK
YXJlIHN0aWxsIGhhcHBlbmluZyBvbiBldmVyeSBib290LgoKMSkKWyAgICA1LjgwNjAzMl0gQlVH
OiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBpbnZhbGlkIGNvbnRleHQgYXQKaW5jbHVk
ZS9saW51eC9zY2hlZC9tbS5oOjE5NgpbICAgIDUuODA2MDQ4XSBpbl9hdG9taWMoKTogMSwgaXJx
c19kaXNhYmxlZCgpOiAwLCBub25fYmxvY2s6IDAsIHBpZDoKNTA0LCBuYW1lOiBzeXN0ZW1kLXVk
ZXZkClsgICAgNS44MDYwNjRdIDEgbG9jayBoZWxkIGJ5IHN5c3RlbWQtdWRldmQvNTA0OgpbICAg
IDUuODA2MDczXSAgIzA6IGZmZmY5YzVhYzJlNGYyNTggKCZkZXYtPm11dGV4KXsuLi4ufS17Mzoz
fSwgYXQ6CmRldmljZV9kcml2ZXJfYXR0YWNoKzB4M2IvMHhiMApbICAgIDUuODA2MDk3XSBDUFU6
IDE0IFBJRDogNTA0IENvbW06IHN5c3RlbWQtdWRldmQgTm90IHRhaW50ZWQKNS4xMS4wLTAucmM2
LjIwMjEwMjA0Z2l0NjE1NTY3MDNiNjEwLjE0NS5mYzM0Lng4Nl82NCAjMQpbICAgIDUuODA2MTE3
XSBIYXJkd2FyZSBuYW1lOiBTeXN0ZW0gbWFudWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0Ck5hbWUv
Uk9HIFNUUklYIFg1NzAtSSBHQU1JTkcsIEJJT1MgMzQwMiAwMS8xMy8yMDIxClsgICAgNS44MDYx
MzVdIENhbGwgVHJhY2U6ClsgICAgNS44MDYxNDJdICBkdW1wX3N0YWNrKzB4OGIvMHhiMApbICAg
IDUuODA2MTUzXSAgX19fbWlnaHRfc2xlZXAuY29sZCsweGI2LzB4YzYKWyAgICA1LjgwNjE2M10g
ID8gZGNuMzBfY2xvY2tfc291cmNlX2NyZWF0ZSsweDM0LzB4YjAgW2FtZGdwdV0KWyAgICA1Ljgw
NjMzOF0gIGttZW1fY2FjaGVfYWxsb2NfdHJhY2UrMHgyMDQvMHgyMzAKWyAgICA1LjgwNjM1M10g
IGRjbjMwX2Nsb2NrX3NvdXJjZV9jcmVhdGUrMHgzNC8weGIwIFthbWRncHVdClsgICAgNS44MDY1
MTZdICBkY24zMF9jcmVhdGVfcmVzb3VyY2VfcG9vbCsweDFkZS8weDEzYjAgW2FtZGdwdV0KWyAg
ICA1LjgwNjY3OF0gID8gcmN1X3JlYWRfbG9ja19zY2hlZF9oZWxkKzB4M2YvMHg4MApbICAgIDUu
ODA2NjkwXSAgPyB0cmFjZV9rbWFsbG9jKzB4YjIvMHhlMApbICAgIDUuODA2Njk5XSAgPyBfX2tt
YWxsb2MrMHgxOTEvMHgyODAKWyAgICA1LjgwNjcxMF0gID8gZGNfY3JlYXRlX3Jlc291cmNlX3Bv
b2wrMHgxMTAvMHgxZDAgW2FtZGdwdV0KWyAgICA1LjgwNjg2OV0gIGRjX2NyZWF0ZV9yZXNvdXJj
ZV9wb29sKzB4MTEwLzB4MWQwIFthbWRncHVdClsgICAgNS44MDcwMjZdICBkY19jcmVhdGUrMHgy
MDUvMHg3OTAgW2FtZGdwdV0KWyAgICA1LjgwNzE4MV0gID8gdHJhY2Vfa21hbGxvYysweGIyLzB4
ZTAKWyAgICA1LjgwNzE5MF0gID8ga21lbV9jYWNoZV9hbGxvY190cmFjZSsweDE3NC8weDIzMApb
ICAgIDUuODA3MjAzXSAgYW1kZ3B1X2RtX2luaXQuaXNyYS4wKzB4MWI5LzB4MjUwIFthbWRncHVd
ClsgICAgNS44MDczNjldICA/IGRldl92cHJpbnRrX2VtaXQrMHgxNzEvMHgxOTUKWyAgICA1Ljgw
NzM4NV0gID8gZGV2X3ByaW50a19lbWl0KzB4M2UvMHg0MApbICAgIDUuODA3NDAzXSAgZG1faHdf
aW5pdCsweGUvMHgyMCBbYW1kZ3B1XQpbICAgIDUuODA3NTYzXSAgYW1kZ3B1X2RldmljZV9pbml0
LmNvbGQrMHgxNzlmLzB4MWFmZCBbYW1kZ3B1XQpbICAgIDUuODA3NzI4XSAgPyBwY2lfY29uZjFf
cmVhZCsweDliLzB4ZjAKWyAgICA1LjgwNzc0MV0gIGFtZGdwdV9kcml2ZXJfbG9hZF9rbXMrMHg2
OC8weDI4MCBbYW1kZ3B1XQpbICAgIDUuODA3ODc3XSAgYW1kZ3B1X3BjaV9wcm9iZSsweDEyOS8w
eDFiMCBbYW1kZ3B1XQpbICAgIDUuODA4MDA5XSAgbG9jYWxfcGNpX3Byb2JlKzB4NDIvMHg4MApb
ICAgIDUuODA4MDIwXSAgcGNpX2RldmljZV9wcm9iZSsweGQ5LzB4MWEwClsgICAgNS44MDgwMzFd
ICByZWFsbHlfcHJvYmUrMHhmMi8weDQ0MApbICAgIDUuODA4MDQyXSAgZHJpdmVyX3Byb2JlX2Rl
dmljZSsweGUxLzB4MTUwClsgICAgNS44MDgwNTNdICBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweGE4
LzB4YjAKWyAgICA1LjgwODA2M10gIF9fZHJpdmVyX2F0dGFjaCsweDhjLzB4MTUwClsgICAgNS44
MDgwNzFdICA/IGRldmljZV9kcml2ZXJfYXR0YWNoKzB4YjAvMHhiMApbICAgIDUuODA4MDgwXSAg
PyBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweGIwLzB4YjAKWyAgICA1LjgwODA5MF0gIGJ1c19mb3Jf
ZWFjaF9kZXYrMHg2Ny8weDkwClsgICAgNS44MDgxMDFdICBidXNfYWRkX2RyaXZlcisweDEyZS8w
eDFmMApbICAgIDUuODA4MTExXSAgZHJpdmVyX3JlZ2lzdGVyKzB4OGYvMHhlMApbICAgIDUuODA4
MTE5XSAgPyAweGZmZmZmZmZmYzBjMDIwMDAKWyAgICA1LjgwODEyOF0gIGRvX29uZV9pbml0Y2Fs
bCsweDY3LzB4MzIwClsgICAgNS44MDgxMzhdICA/IHJjdV9yZWFkX2xvY2tfc2NoZWRfaGVsZCsw
eDNmLzB4ODAKWyAgICA1LjgwODE0OF0gID8gdHJhY2Vfa21hbGxvYysweGIyLzB4ZTAKWyAgICA1
LjgwODE1N10gID8ga21lbV9jYWNoZV9hbGxvY190cmFjZSsweDE3NC8weDIzMApbICAgIDUuODA4
MTY5XSAgZG9faW5pdF9tb2R1bGUrMHg1Yy8weDI3MApbICAgIDUuODA4MTc5XSAgX19kb19zeXNf
aW5pdF9tb2R1bGUrMHgxMzAvMHgxOTAKWyAgICA1LjgwODE5Nl0gIGRvX3N5c2NhbGxfNjQrMHgz
My8weDQwClsgICAgNS44MDgyMDVdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0
NC8weGE5ClsgICAgNS44MDgyMTZdIFJJUDogMDAzMzoweDdmNGQxMzNhYTQwZQpbICAgIDUuODA4
MjI1XSBDb2RlOiA0OCA4YiAwZCA2NSAxYSAwYyAwMCBmNyBkOCA2NCA4OSAwMSA0OCA4MyBjOCBm
ZgpjMyA2NiAyZSAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCA5MCBmMyAwZiAxZSBmYSA0OSA4OSBj
YSBiOCBhZiAwMCAwMAowMCAwZiAwNSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4IDhi
IDBkIDMyIDFhIDBjIDAwIGY3IGQ4IDY0IDg5CjAxIDQ4ClsgICAgNS44MDgyNTZdIFJTUDogMDAy
YjowMDAwN2ZmYzgxMzE3ZmI4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6CjAwMDAwMDAwMDAw
MDAwYWYKWyAgICA1LjgwODI3Ml0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU2M2Y3
OTUwOWVlMCBSQ1g6IDAwMDA3ZjRkMTMzYWE0MGUKWyAgICA1LjgwODI4NV0gUkRYOiAwMDAwNTYz
Zjc5NTFkYWEwIFJTSTogMDAwMDAwMDAwMGI4YTg1ZSBSREk6IDAwMDA1NjNmNzlmMDNkYjAKWyAg
ICA1LjgwODI5OF0gUkJQOiAwMDAwNTYzZjc5ZjAzZGIwIFIwODogMDAwMDU2M2Y3OTUwOWZkMCBS
MDk6IDAwMDA3ZmZjODEzMTQ2YmUKWyAgICA1LjgwODMxMV0gUjEwOiAwMDAwNTYzYTFhYTcwOTU5
IFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDA1NjNmNzk1MWRhYTAKWyAgICA1LjgwODMy
NF0gUjEzOiAwMDAwNTYzZjc5NTBlOWMwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6IDAwMDA1
NjNmNzk1MWYxMDAKCgoyKQpbICAgIDYuMDY0MTA3XSBCVUc6IGtleSBmZmZmOWM1YWRiMzM5MTQ4
IGhhcyBub3QgYmVlbiByZWdpc3RlcmVkIQpbICAgIDYuMDY0MTE5XSAtLS0tLS0tLS0tLS1bIGN1
dCBoZXJlIF0tLS0tLS0tLS0tLS0KWyAgICA2LjA2NDEyMV0gREVCVUdfTE9DS1NfV0FSTl9PTigx
KQpbICAgIDYuMDY0MTI0XSBXQVJOSU5HOiBDUFU6IDE0IFBJRDogNTA0IGF0Cmtlcm5lbC9sb2Nr
aW5nL2xvY2tkZXAuYzo0NjE4IGxvY2tkZXBfaW5pdF9tYXBfd2FpdHMrMHgxOGIvMHgyMTAKWyAg
ICA2LjA2NDEzMV0gTW9kdWxlcyBsaW5rZWQgaW46IGFtZGdwdSgrKSBkcm1fdHRtX2hlbHBlciB0
dG0KaW9tbXVfdjIgZ3B1X3NjaGVkIGRybV9rbXNfaGVscGVyIGNyY3QxMGRpZl9wY2xtdWwgY3Jj
MzJfcGNsbXVsCmNyYzMyY19pbnRlbCBjZWMgaWdiIGRybSBnaGFzaF9jbG11bG5pX2ludGVsIGNj
cCBudm1lIGRjYSBpMmNfYWxnb19iaXQKbnZtZV9jb3JlIHdtaSBwaW5jdHJsX2FtZCBmdXNlClsg
ICAgNi4wNjQxNDddIENQVTogMTQgUElEOiA1MDQgQ29tbTogc3lzdGVtZC11ZGV2ZCBUYWludGVk
OiBHClcgICAgICAgIC0tLS0tLS0tLSAtLS0KNS4xMS4wLTAucmM2LjIwMjEwMjA0Z2l0NjE1NTY3
MDNiNjEwLjE0NS5mYzM0Lng4Nl82NCAjMQpbICAgIDYuMDY0MTUyXSBIYXJkd2FyZSBuYW1lOiBT
eXN0ZW0gbWFudWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0Ck5hbWUvUk9HIFNUUklYIFg1NzAtSSBH
QU1JTkcsIEJJT1MgMzQwMiAwMS8xMy8yMDIxClsgICAgNi4wNjQxNTZdIFJJUDogMDAxMDpsb2Nr
ZGVwX2luaXRfbWFwX3dhaXRzKzB4MThiLzB4MjEwClsgICAgNi4wNjQxNTldIENvZGU6IDAwIDg1
IGMwIDBmIDg0IDc3IGZmIGZmIGZmIDhiIDNkIDA4IDVlIGYxIDAxIDg1CmZmIDBmIDg1IDY5IGZm
IGZmIGZmIDQ4IGM3IGM2IGNjIDk4IDYwIDlhIDQ4IGM3IGM3IDdkIGQ0IDVhIDlhIGU4IDUxCjNh
IGI3IDAwIDwwZj4gMGIgZTkgNGYgZmYgZmYgZmYgZTggYzkgODIgYmQgMDAgODUgYzAgNzQgMjEg
NDQgOGIgMTUgZDYKNWQgZjEKWyAgICA2LjA2NDE2NV0gUlNQOiAwMDE4OmZmZmZiYmE3MDFiZTc4
YzggRUZMQUdTOiAwMDAxMDI5MgpbICAgIDYuMDY0MTY4XSBSQVg6IDAwMDAwMDAwMDAwMDAwMTYg
UkJYOiBmZmZmZmZmZjlhMjQ3YjgwIFJDWDogMDAwMDAwMDAwMDAwMDAyNwpbICAgIDYuMDY0MTcx
XSBSRFg6IGZmZmY5YzYxYzg3ZGIyYTggUlNJOiAwMDAwMDAwMDAwMDAwMDAxIFJESTogZmZmZjlj
NjFjODdkYjJhMApbICAgIDYuMDY0MTc0XSBSQlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiAwMDAw
MDAwMDAwMDAwMDAwIFIwOTogZmZmZmJiYTcwMWJlNzcwMApbICAgIDYuMDY0MTc3XSBSMTA6IGZm
ZmZiYmE3MDFiZTc2ZjggUjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogZmZmZjljNWFkYjMzOTE0
OApbICAgIDYuMDY0MTgwXSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmOWM1YWRiNjEw
MzQ4IFIxNTogZmZmZjljNWFkYjYxMDM0OApbICAgIDYuMDY0MTgzXSBGUzogIDAwMDA3ZjRkMTI3
OWMzNDAoMDAwMCkgR1M6ZmZmZjljNjFjODYwMDAwMCgwMDAwKQprbmxHUzowMDAwMDAwMDAwMDAw
MDAwClsgICAgNi4wNjQxODZdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAw
MDAwODAwNTAwMzMKWyAgICA2LjA2NDE4OV0gQ1IyOiAwMDAwNTYzZjc5NjU3MDAwIENSMzogMDAw
MDAwMDExMTM5NjAwMCBDUjQ6IDAwMDAwMDAwMDAzNTBlZTAKWyAgICA2LjA2NDE5Ml0gQ2FsbCBU
cmFjZToKWyAgICA2LjA2NDE5NF0gIF9fa2VybmZzX2NyZWF0ZV9maWxlKzB4N2IvMHgxMDAKWyAg
ICA2LjA2NDE5OF0gIHN5c2ZzX2FkZF9maWxlX21vZGVfbnMrMHhhMi8weDE5MApbICAgIDYuMDY0
MjAyXSAgc3lzZnNfY3JlYXRlX2Jpbl9maWxlKzB4NTAvMHg3MApbICAgIDYuMDY0MjA1XSAgaGRj
cF9jcmVhdGVfd29ya3F1ZXVlKzB4M2JkLzB4NDEwIFthbWRncHVdClsgICAgNi4wNjQzNjVdICBh
bWRncHVfZG1faW5pdC5pc3JhLjAuY29sZCsweDI5My8weDEzZTcgW2FtZGdwdV0KWyAgICA2LjA2
NDUyNl0gID8gZGV2X3ZwcmludGtfZW1pdCsweDE3MS8weDE5NQpbICAgIDYuMDY0NTI5XSAgPyBw
c3Bfc2V0X3NybSsweGIwLzB4YjAgW2FtZGdwdV0KWyAgICA2LjA2NDY5MV0gID8gaGRjcF91cGRh
dGVfZGlzcGxheSsweDFmMC8weDFmMCBbYW1kZ3B1XQpbICAgIDYuMDY0ODQ3XSAgPyBkZXZfcHJp
bnRrX2VtaXQrMHgzZS8weDQwClsgICAgNi4wNjQ4NTFdICBkbV9od19pbml0KzB4ZS8weDIwIFth
bWRncHVdClsgICAgNi4wNjUwMDVdICBhbWRncHVfZGV2aWNlX2luaXQuY29sZCsweDE3OWYvMHgx
YWZkIFthbWRncHVdClsgICAgNi4wNjUxNjBdICA/IHBjaV9jb25mMV9yZWFkKzB4OWIvMHhmMApb
ICAgIDYuMDY1MTY0XSAgYW1kZ3B1X2RyaXZlcl9sb2FkX2ttcysweDY4LzB4MjgwIFthbWRncHVd
ClsgICAgNi4wNjUyOTFdICBhbWRncHVfcGNpX3Byb2JlKzB4MTI5LzB4MWIwIFthbWRncHVdClsg
ICAgNi4wNjU0MTVdICBsb2NhbF9wY2lfcHJvYmUrMHg0Mi8weDgwClsgICAgNi4wNjU0MThdICBw
Y2lfZGV2aWNlX3Byb2JlKzB4ZDkvMHgxYTAKWyAgICA2LjA2NTQyMV0gIHJlYWxseV9wcm9iZSsw
eGYyLzB4NDQwClsgICAgNi4wNjU0MjVdICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4ZTEvMHgxNTAK
WyAgICA2LjA2NTQyOF0gIGRldmljZV9kcml2ZXJfYXR0YWNoKzB4YTgvMHhiMApbICAgIDYuMDY1
NDMxXSAgX19kcml2ZXJfYXR0YWNoKzB4OGMvMHgxNTAKWyAgICA2LjA2NTQzM10gID8gZGV2aWNl
X2RyaXZlcl9hdHRhY2grMHhiMC8weGIwClsgICAgNi4wNjU0MzVdICA/IGRldmljZV9kcml2ZXJf
YXR0YWNoKzB4YjAvMHhiMApbICAgIDYuMDY1NDM4XSAgYnVzX2Zvcl9lYWNoX2RldisweDY3LzB4
OTAKWyAgICA2LjA2NTQ0MV0gIGJ1c19hZGRfZHJpdmVyKzB4MTJlLzB4MWYwClsgICAgNi4wNjU0
NDVdICBkcml2ZXJfcmVnaXN0ZXIrMHg4Zi8weGUwClsgICAgNi4wNjU0NDddICA/IDB4ZmZmZmZm
ZmZjMGMwMjAwMApbICAgIDYuMDY1NDQ5XSAgZG9fb25lX2luaXRjYWxsKzB4NjcvMHgzMjAKWyAg
ICA2LjA2NTQ1Ml0gID8gcmN1X3JlYWRfbG9ja19zY2hlZF9oZWxkKzB4M2YvMHg4MApbICAgIDYu
MDY1NDU1XSAgPyB0cmFjZV9rbWFsbG9jKzB4YjIvMHhlMApbICAgIDYuMDY1NDU4XSAgPyBrbWVt
X2NhY2hlX2FsbG9jX3RyYWNlKzB4MTc0LzB4MjMwClsgICAgNi4wNjU0NjJdICBkb19pbml0X21v
ZHVsZSsweDVjLzB4MjcwClsgICAgNi4wNjU0NjVdICBfX2RvX3N5c19pbml0X21vZHVsZSsweDEz
MC8weDE5MApbICAgIDYuMDY1NDY5XSAgZG9fc3lzY2FsbF82NCsweDMzLzB4NDAKWyAgICA2LjA2
NTQ3Ml0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKWyAgICA2LjA2
NTQ3NV0gUklQOiAwMDMzOjB4N2Y0ZDEzM2FhNDBlClsgICAgNi4wNjU0NzddIENvZGU6IDQ4IDhi
IDBkIDY1IDFhIDBjIDAwIGY3IGQ4IDY0IDg5IDAxIDQ4IDgzIGM4IGZmCmMzIDY2IDJlIDBmIDFm
IDg0IDAwIDAwIDAwIDAwIDAwIDkwIGYzIDBmIDFlIGZhIDQ5IDg5IGNhIGI4IGFmIDAwIDAwCjAw
IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQgMzIgMWEgMGMgMDAg
ZjcgZDggNjQgODkKMDEgNDgKWyAgICA2LjA2NTQ4M10gUlNQOiAwMDJiOjAwMDA3ZmZjODEzMTdm
YjggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDoKMDAwMDAwMDAwMDAwMDBhZgpbICAgIDYuMDY1
NDg3XSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwNTYzZjc5NTA5ZWUwIFJDWDogMDAw
MDdmNGQxMzNhYTQwZQpbICAgIDYuMDY1NDkwXSBSRFg6IDAwMDA1NjNmNzk1MWRhYTAgUlNJOiAw
MDAwMDAwMDAwYjhhODVlIFJESTogMDAwMDU2M2Y3OWYwM2RiMApbICAgIDYuMDY1NDkzXSBSQlA6
IDAwMDA1NjNmNzlmMDNkYjAgUjA4OiAwMDAwNTYzZjc5NTA5ZmQwIFIwOTogMDAwMDdmZmM4MTMx
NDZiZQpbICAgIDYuMDY1NDk2XSBSMTA6IDAwMDA1NjNhMWFhNzA5NTkgUjExOiAwMDAwMDAwMDAw
MDAwMjQ2IFIxMjogMDAwMDU2M2Y3OTUxZGFhMApbICAgIDYuMDY1NDk5XSBSMTM6IDAwMDA1NjNm
Nzk1MGU5YzAgUjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNTogMDAwMDU2M2Y3OTUxZjEwMApbICAg
IDYuMDY1NTAzXSBpcnEgZXZlbnQgc3RhbXA6IDMwNDQ1OQpbICAgIDYuMDY1NTA1XSBoYXJkaXJx
cyBsYXN0ICBlbmFibGVkIGF0ICgzMDQ0NTkpOgpbPGZmZmZmZmZmOTkxNjlkNTc+XSBjb25zb2xl
X3VubG9jaysweDUyNy8weDY0MApbICAgIDYuMDY1NTEwXSBoYXJkaXJxcyBsYXN0IGRpc2FibGVk
IGF0ICgzMDQ0NTgpOgpbPGZmZmZmZmZmOTkxNjljYTI+XSBjb25zb2xlX3VubG9jaysweDQ3Mi8w
eDY0MApbICAgIDYuMDY1NTE0XSBzb2Z0aXJxcyBsYXN0ICBlbmFibGVkIGF0ICgzMDQzNTApOgpb
PGZmZmZmZmZmOTllMDExNTI+XSBhc21fY2FsbF9pcnFfb25fc3RhY2srMHgxMi8weDIwClsgICAg
Ni4wNjU1MThdIHNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDMwNDM0NSk6Cls8ZmZmZmZmZmY5
OWUwMTE1Mj5dIGFzbV9jYWxsX2lycV9vbl9zdGFjaysweDEyLzB4MjAKWyAgICA2LjA2NTUyMl0g
LS0tWyBlbmQgdHJhY2UgM2U5OTZkN2QxMDYwODYzNSBdLS0tCgoKRnVsbCBrZXJuZWwgbG9nIGlz
IGhlcmU6IGh0dHBzOi8vcGFzdGViaW4uY29tL3NndWY3VGFjCgotLSAKQmVzdCBSZWdhcmRzLApN
aWtlIEdhdnJpbG92LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
