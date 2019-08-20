Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FB96B23
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 23:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B28A6E7EC;
	Tue, 20 Aug 2019 21:08:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD4D6E7EC
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 21:08:54 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A37320ABB
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 21:08:54 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id e2so215626qtm.19
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 14:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=AnWlhmn/JlYK1DNquuRh+KnIV3BiyD6lzLrArVHcZ6E=;
 b=irLv7/JbRxzt/jSfLUZpw9tlrflgekyd2fKCAG5RbzJSNNy9oSfSpE30YVsoEkoUEc
 Yu6t6XYMfgZJqOQNYykcsL71o8wlbTY1m3lNq2XN43TlYF0wqi5BtGfXZcuFXZNxZ6ju
 9L/c0GN9l1UPgqRNFiDj+sE2f+cDn4+iTutNK1s78NnAW07PSckgg50uHES6FxNlvcAl
 ot45Wgwt6QdBJ3ZG61ejqTQiC97dHMMJlCe98PnsBDB3gqU4QZ3h3eu4at03PwojR7hO
 d7FzPPJgc+ZQ/Fndwf3o18oxEsyVOKbtunO+xzo3kU92VVQbfQGfI9TA5qHfz7PLCEYI
 39xA==
X-Gm-Message-State: APjAAAV79Gmv7fNIbxjimG3VNBO3A5cxkB9RUyGhzCN051lREW4Ty1sm
 5lNomjD576jJwEZzdfbg2ue59hmOCShodGzEQihTuILup5HpX1vpk0B7wshbjRMmLhYaKrvWjrL
 de0YFXfxej2ihvClgo0WQeJS90w==
X-Received: by 2002:aed:3325:: with SMTP id u34mr27498404qtd.324.1566335333439; 
 Tue, 20 Aug 2019 14:08:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJKex8JG1qD4EwVeYA+CeYE8FcxzTkHqTHW7jBbvW6BLSOGAC42sRSWukOlkZKTENO77CWHQ==
X-Received: by 2002:aed:3325:: with SMTP id u34mr27498391qtd.324.1566335333257; 
 Tue, 20 Aug 2019 14:08:53 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id b24sm9086165qtp.25.2019.08.20.14.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:08:52 -0700 (PDT)
Message-ID: <27f7f3c88d6fd5ec42e1be4c7c2515ab741ace70.camel@redhat.com>
Subject: Re: [PATCH v2 10/14] drm/dp-mst: Fill branch->num_ports
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Tue, 20 Aug 2019 17:08:51 -0400
In-Reply-To: <20190820191203.25807-11-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
 <20190820191203.25807-11-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTIwIGF0IDE1OjExIC0wNDAwLCBEYXZpZCBGcmFuY2lzIHdyb3RlOgo+
IFRoaXMgZmllbGQgb24gZHJtX2RwX21zdF9icmFuY2ggd2FzIG5ldmVyIGZpbGxlZAo+IAo+IElu
aXRpYWxpemUgaXQgdG8gemVybyB3aGVuIHRoZSBsaXN0IG9mIHBvcnRzIGlzIGNyZWF0ZWQuCj4g
V2hlbiBhIHBvcnQgaXMgYWRkZWQgdG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwo+IGluZGV4IDVkNWJkNDJkYTE3Yy4uMGM1ODBkNTI3OWMxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTkxOCw2ICs5MTgsNyBAQCBz
dGF0aWMgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoCj4gKmRybV9kcF9hZGRfbXN0X2JyYW5jaF9k
ZXZpY2UodTggbGN0LCB1OCAqcmFkKQo+ICAJSU5JVF9MSVNUX0hFQUQoJm1zdGItPnBvcnRzKTsK
PiAgCWtyZWZfaW5pdCgmbXN0Yi0+dG9wb2xvZ3lfa3JlZik7Cj4gIAlrcmVmX2luaXQoJm1zdGIt
Pm1hbGxvY19rcmVmKTsKPiArCW1zdGItPm51bV9wb3J0cyA9IDA7Cj4gIAlyZXR1cm4gbXN0YjsK
PiAgfQo+ICAKPiBAQCAtMTY3Miw2ICsxNjczLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9w
b3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaAo+ICptc3RiLAo+ICAJCW11dGV4X2xvY2soJm1z
dGItPm1nci0+bG9jayk7Cj4gIAkJZHJtX2RwX21zdF90b3BvbG9neV9nZXRfcG9ydChwb3J0KTsK
PiAgCQlsaXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1zdGItPnBvcnRzKTsKPiArCQltc3RiLT5udW1f
cG9ydHMrKzsKCllvdSdyZSBmb3Jnb3QgdG8gYWRkIG1zdGItPm51bV9wb3J0cy0tOyBsb3dlciBk
b3duIGluIHRoZSBmdW5jdGlvbjoKCgkJaWYgKCFwb3J0LT5jb25uZWN0b3IpIHsKCQkJLyogcmVt
b3ZlIGl0IGZyb20gdGhlIHBvcnQgbGlzdCAqLwoJCQltdXRleF9sb2NrKCZtc3RiLT5tZ3ItPmxv
Y2spOwoJCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7Ci8qIFJpZ2h0IGhlcmUgLS0tLS0tLS0+ICov
CgkJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKCQkJLyogZHJvcCBwb3J0IGxpc3Qg
cmVmZXJlbmNlICovCgkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7CgkJCWdv
dG8gb3V0OwoJCX0KCldpdGggdGhhdCBmaXhlZDoKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgoKPiAgCQltdXRleF91bmxvY2soJm1zdGItPm1nci0+bG9jayk7Cj4g
IAl9Cj4gIAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
