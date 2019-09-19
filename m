Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2FB8830
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 01:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D926FC10;
	Thu, 19 Sep 2019 23:44:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15D36FC10
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 23:44:34 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-S5J2nbQsN2OH1ukZQ0-YSg-1; Thu, 19 Sep 2019 19:44:32 -0400
Received: by mail-qk1-f200.google.com with SMTP id g62so5935330qkb.20
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 16:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=71ffCnR41g9eUHADpSSyhwQT0MSKqM6+8yW7cpq+uug=;
 b=fezaxL16h/FpSphSZcsFjJNr0FMvczSrReDvuXU6A2wkUSoktZ34RML/CENFltOLmz
 hDaWlu1gy/hMLh5oxSG50bh3OGye+ZE+IUyk63nMT4KsrAyIPyatP54TECN7Ynr4Ndp8
 XJ5NUBEMY/9Y6RwkYiwLZFMXiIPd7i+qngU45rZlMkjO4dsP6bRp3U8tIvj/QIVBGVjW
 i5Rnx8C3LuQj38uGjrayYZxQtBGG3JjRe/JUxsY8+axaFt0ebF0YKm3y5yCQJX9+d8AS
 4F3uEk5fYfzSUEQLkO7oLZXvqP+xf/Pi7+S5xO7pzWWu5tPBuIkXklYqyNb93GudHdVa
 57zw==
X-Gm-Message-State: APjAAAXF7eJ7gB8/vBAShDIVTpG4cOzVblLC8pxf0SdSa96AiYJh4CId
 Xdq5cSga/AmnZaKCzAnuqXobNrAoacUdH4CTUTg4a1bVPm13fCxQqzvHU47M//taHjbS8Sfekwo
 k7dTT/5pn6hhOgQ1SvPUotyE2jQ==
X-Received: by 2002:a37:9e57:: with SMTP id h84mr468877qke.226.1568936670582; 
 Thu, 19 Sep 2019 16:44:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXi9QzRb2IFxjv5+1Wf9GdVP+igr/ePBZVr5yMvukObghlo/u3i2TRS8AWVOa+ldX7InyTyQ==
X-Received: by 2002:a37:9e57:: with SMTP id h84mr468868qke.226.1568936670388; 
 Thu, 19 Sep 2019 16:44:30 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 56sm200277qty.15.2019.09.19.16.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 16:44:29 -0700 (PDT)
Message-ID: <1ceffe460c57ed74df7cc03a9dd7238102be2cf0.camel@redhat.com>
Subject: Re: [PATCH 09/15] drm/dp_mst: Add new quirk for Synaptics MST hubs
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Thu, 19 Sep 2019 19:44:28 -0400
In-Reply-To: <6b11214d7aaa5bff6ba60846a1569b6f2ac25b0b.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
 <6b11214d7aaa5bff6ba60846a1569b6f2ac25b0b.1568833906.git.mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: S5J2nbQsN2OH1ukZQ0-YSg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568936673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pgp6/fZ9R2+n/N2IU7yg2BIR99H2/1zQ5aNF9NLmk50=;
 b=UFnmsNXEbgTlrZhdHkgm1LYM8AgBc0xI+U1V5LdAidoNPD98wYH2RnQAMqezIwqad7oeNn
 w8AY3vbsa4NP52jh3waBBh05lu0hxbuhFOPWcVCJvLEP92OCXE2tZWkDnOL/d0v1QUwpdg
 O8T99D8gLFr7zjWXVsTAdx2yygKv5fs=
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Francis <David.Francis@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

R3JlYXQgd29yayEKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoK
T24gV2VkLCAyMDE5LTA5LTE4IGF0IDE2OjI2IC0wNDAwLCBtaWtpdGEubGlwc2tpQGFtZC5jb20g
d3JvdGU6Cj4gRnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgo+IAo+
IFN5bmFwdGljcyBEUDEuNCBodWJzIChCUkFOQ0hfSUQgMHg5MENDMjQpIGRvIG5vdAo+IHN1cHBv
cnQgdmlydHVhbCBEUENEIHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgo+IFRoZSBEU0Mg
Y2FwcyBjYW4gYmUgcmVhZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXgsCj4gbGlrZSBpbiBTU1QgRFND
LiBUaGVzZSBodWJzIGhhdmUgbWFueSBkaWZmZXJlbnQKPiBERVZJQ0VfSURzLiAgQWRkIGEgbmV3
IHF1aXJrIHRvIGRldGVjdCB0aGlzIGNhc2UuCj4gCj4gQ2hhbmdlLUlkOiBJOWQzMzJmMjczZGZj
YTBjZmJjZWQxMTFlNjJmNWEwNmM1YzMxMjg5Mwo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgo+
IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBSZXZpZXdlZC1i
eTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jICAgICAgIHwgIDQgKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGlu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgICAgICAgfCAgNyArKysrKysrCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCj4gaW5kZXggMGNiZjEwNzI3YmQ2Li5jM2UxZGE3OGU0NDIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBAQCAtMTI4OCw3ICsxMjg4LDkgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcGNkX3F1aXJrIGRwY2RfcXVpcmtfbGlzdFtdID0gewo+ICAJLyogTEcgTFAx
NDBXRjYtU1BNMSBlRFAgcGFuZWwgKi8KPiAgCXsgT1VJKDB4MDAsIDB4MjIsIDB4YjkpLCBERVZJ
Q0VfSUQoJ3MnLCAnaScsICd2JywgJ2EnLCAncicsICdUJyksCj4gZmFsc2UsIEJJVChEUF9EUENE
X1FVSVJLX0NPTlNUQU5UX04pIH0sCj4gIAkvKiBBcHBsZSBwYW5lbHMgbmVlZCBzb21lIGFkZGl0
aW9uYWwgaGFuZGxpbmcgdG8gc3VwcG9ydCBQU1IgKi8KPiAtCXsgT1VJKDB4MDAsIDB4MTAsIDB4
ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwKPiBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0K
PiArCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwKPiBCSVQo
RFBfRFBDRF9RVUlSS19OT19QU1IpIH0sCj4gKwkvKiBTeW5hcHRpY3MgRFAxLjQgTVNUIGh1YnMg
Y2FuIHN1cHBvcnQgRFNDIHdpdGhvdXQgdmlydHVhbCBEUENEICovCj4gKwl7IE9VSSgweDkwLCAw
eENDLCAweDI0KSwgREVWSUNFX0lEX0FOWSwgdHJ1ZSwKPiBCSVQoRFBfRFBDRF9RVUlSS19EU0Nf
V0lUSE9VVF9WSVJUVUFMX0RQQ0QpIH0sCj4gIH07Cj4gIAo+ICAjdW5kZWYgT1VJCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCBkZDJjYTA2NWNjOTIuLjRlNDkz
ZDhhZjI4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC00
MjE5LDYgKzQyMTksNyBAQCBzdHJ1Y3QgZHJtX2RwX2F1eCAqZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0KHN0cnVjdAo+IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKPiAgewo+ICAJc3RydWN0IGRy
bV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7Cj4gIAlzdHJ1Y3QgZHJtX2Rw
X21zdF9wb3J0ICpmZWNfcG9ydDsKPiArCXN0cnVjdCBkcm1fZHBfZGVzYyBkZXNjID0geyAwIH07
Cj4gIAo+ICAJaWYgKCFwb3J0KQo+ICAJCXJldHVybiBOVUxMOwo+IEBAIC00MjcxLDYgKzQyNzIs
MzIgQEAgc3RydWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1
Y3QKPiBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4gIAlpZiAoZHJtX2RwX21zdF9pc192aXJ0dWFs
X2RwY2QocG9ydCkpCj4gIAkJcmV0dXJuICZwb3J0LT5hdXg7Cj4gIAo+ICsJLyoKPiArCSAqIFN5
bmFwdGljcyBxdWlyawo+ICsJICogQXBwbGllcyB0byBwb3J0cyBmb3Igd2hpY2g6Cj4gKwkgKiAt
IFBoeXNpY2FsIGF1eCBoYXMgU3luYXB0aWNzIE9VSQo+ICsJICogLSBEUHYxLjQgb3IgaGlnaGVy
Cj4gKwkgKiAtIFBvcnQgaXMgb24gcHJpbWFyeSBicmFuY2ggZGV2aWNlCj4gKwkgKiAtIE5vdCBh
IFZHQSBhZGFwdGVyIChEUF9EV05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKQo+ICsJICovCj4gKwlp
ZiAoIWRybV9kcF9yZWFkX2Rlc2MocG9ydC0+bWdyLT5hdXgsICZkZXNjLCB0cnVlKSkKPiArCQly
ZXR1cm4gTlVMTDsKPiArCj4gKwlpZiAoZHJtX2RwX2hhc19xdWlyaygmZGVzYywgRFBfRFBDRF9R
VUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QpICYmCj4gKwkgICAgcG9ydC0+bWdyLT5kcGNk
W0RQX0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8xNCAmJgo+ICsJICAgIHBvcnQtPnBhcmVudCA9
PSBwb3J0LT5tZ3ItPm1zdF9wcmltYXJ5KSB7Cj4gKwkJdTggZG93bnN0cmVhbXBvcnQ7Cj4gKwo+
ICsJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5hdXgsIERQX0RPV05TVFJFQU1QT1JUX1BS
RVNFTlQsCj4gKwkJCQkgICAgICZkb3duc3RyZWFtcG9ydCwgMSkgPCAwKQo+ICsJCQlyZXR1cm4g
TlVMTDsKPiArCj4gKwkJaWYgKChkb3duc3RyZWFtcG9ydCAmIERQX0RXTl9TVFJNX1BPUlRfUFJF
U0VOVCkgJiYKPiArCQkgICAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NUUk1fUE9SVF9UWVBF
X01BU0spCj4gKwkJICAgICAhPSBEUF9EV05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKSkKPiArCQkJ
cmV0dXJuIHBvcnQtPm1nci0+YXV4Owo+ICsJfQo+ICsKPiAgCXJldHVybiBOVUxMOwo+ICB9Cj4g
IEVYUE9SVF9TWU1CT0woZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KTsKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oCj4gaW5kZXggNmFlMWE2NzY1ZjYzLi45MTlhZDk0MGJmYjEgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oCj4gQEAgLTE0MTQsNiArMTQxNCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7Cj4gIAkgKiBk
cml2ZXIgc3RpbGwgbmVlZCB0byBpbXBsZW1lbnQgcHJvcGVyIGhhbmRsaW5nIGZvciBzdWNoIGRl
dmljZS4KPiAgCSAqLwo+ICAJRFBfRFBDRF9RVUlSS19OT19QU1IsCj4gKwkvKioKPiArCSAqIEBE
UF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBDRDoKPiArCSAqCj4gKwkgKiBUaGUg
ZGV2aWNlIHN1cHBvcnRzIE1TVCBEU0MgZGVzcGl0ZSBub3Qgc3VwcG9ydGluZyBWaXJ0dWFsIERQ
Q0QuCj4gKwkgKiBUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQgZnJvbSB0aGUgcGh5c2ljYWwgYXV4
IGluc3RlYWQuCj4gKwkgKi8KPiArCURQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9E
UENELAo+ICB9Owo+ICAKPiAgLyoqCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
