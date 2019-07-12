Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B867599
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 21:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529DA6E37F;
	Fri, 12 Jul 2019 19:55:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12996E37F
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 19:55:44 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id s22so7310288qkj.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 12:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DPl+m+lBq9+B9rcJujBekjym3J7/OdwIHcDR75e8t6Q=;
 b=pruKLGc9CRU0bCpk626aj6Jb8ZsQ7o8zyu4AC59aB+w/mgKw/CpQ/UdRY1J4317pX8
 8lyQXvHTp0O5e7sQmpedTzNYfcv69Ylm4ID4BgJF3uDXdhV8szKQpOwwazCpreyP8T06
 rh6SJstnw3z3iTdBSbB9PP6x6G9VpK6R+Rp5I1F6x67bBAbT3E82engXu1nQZo/yQ9JD
 jmYoig8Y+avXBhW/xIZIl9te1n/1/oUqn7G2LKwcqvLPxBp7lUikqKoSKU4dy886wr97
 Vrj6E9A5m9SYHNfAeM6l9Y9//IRqgVPcJLAezAmMRGA9Y3cgdaJKQtimadHuwAkuA0Xw
 t8OA==
X-Gm-Message-State: APjAAAUrHklkudpelYNl4d9wZ/mAyFt8T87malzLI1YM9QX4liTxXVAv
 SUy7U9cPfykKpExPgO99GqIxMw==
X-Google-Smtp-Source: APXvYqx1HGInbkt7yT6Je/Daaz06Bco/++z43iC+tVH8r5l7fwYMxAj0yGHtch4KyRCg2pWj2m1RNQ==
X-Received: by 2002:a37:a5cb:: with SMTP id o194mr7989179qke.371.1562961344024; 
 Fri, 12 Jul 2019 12:55:44 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id r205sm5090843qke.115.2019.07.12.12.55.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 12:55:43 -0700 (PDT)
Message-ID: <93fcded587fd0a2c67df35cc74d6406bd3267c4c.camel@redhat.com>
Subject: Re: [PATCH 04/10] drm/nouveau: Use connector kdev as aux device parent
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 12 Jul 2019 15:55:42 -0400
In-Reply-To: <20190704190519.29525-5-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-5-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
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
Cc: Ben Skeggs <bskeggs@redhat.com>, ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUaHUsIDIwMTkt
MDctMDQgYXQgMTU6MDUgLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9tOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBTZXQgdGhlIGNvbm5lY3RvcidzIGtlcm5l
bCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKPiBkZXZpY2UuIFRoaXMg
YWxsb3dzIHVkZXYgcnVsZXMgdG8gYWNjZXNzIGNvbm5lY3RvciBhdHRyaWJ1dGVzIHdoZW4KPiBj
cmVhdGluZyBzeW1saW5rcyB0byBhdXggZGV2aWNlcy4KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNr
ZWdnc0ByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0
b3IuYwo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwo+IGlu
ZGV4IDQxMTZlZTYyYWRhZi4uZTMyZGVmMDllZjg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gQEAgLTEzNDYsNyArMTM0Niw3IEBAIG5vdXZl
YXVfY29ubmVjdG9yX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCWJyZWFrOwo+
ICAJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQ6Cj4gIAljYXNlIERSTV9NT0RF
X0NPTk5FQ1RPUl9lRFA6Cj4gLQkJbnZfY29ubmVjdG9yLT5hdXguZGV2ID0gZGV2LT5kZXY7Cj4g
KwkJbnZfY29ubmVjdG9yLT5hdXguZGV2ID0gY29ubmVjdG9yLT5rZGV2Owo+ICAJCW52X2Nvbm5l
Y3Rvci0+YXV4LnRyYW5zZmVyID0gbm91dmVhdV9jb25uZWN0b3JfYXV4X3hmZXI7Cj4gIAkJc25w
cmludGYoYXV4X25hbWUsIHNpemVvZihhdXhfbmFtZSksICJzb3ItJTA0eC0lMDR4IiwKPiAgCQkJ
IGRjYmUtPmhhc2h0LCBkY2JlLT5oYXNobSk7Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
