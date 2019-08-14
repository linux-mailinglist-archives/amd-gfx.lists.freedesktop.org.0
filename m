Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95D8CCB9
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 09:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449026E282;
	Wed, 14 Aug 2019 07:28:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642836E282
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 07:27:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so1824559wrd.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 00:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JQdQag4Ifsbe/I89zEDNBojTSBr9rb7H5xpQ709Z2yY=;
 b=NM/KyYEfz3VlZkNSyp9kFfDuH4BHoIirJSgTFIMkgrGOgfCI8ldvtFHNQO7yYgrl+S
 +V+kinH4JPI2DMEMOyQAirR+uJyCsIMjysypDzEn1+V7cPVD8Z4fbnI3Y3EFF6ZD2SZO
 tgVByN9R6m3a0XtYlXhz4JY5FLqNr1rOqi4ILfUKXMO3J0C/uhqBOEES2FFEWDFCw5Yq
 mxrZa+jxAkf7pkZ4Is3bt0HukIVVFDvgjVe9rQ5AW4cxzaUUmhsfu/+bQSOcRUfUxOLq
 zQMJ0GT+rmNBlUFR2NhSnNZKkge9ndGVB4lr5AzbdSX2q0vS+4T7adRDUVKuba8SEITf
 mJcA==
X-Gm-Message-State: APjAAAURrzPu6rfK/0oeCnShw0OlkwgBFU6Kr7qaWBqNLbLeEhjSxmIs
 K8MeG5qjPhiFK2zH6gZn7RkANqBw
X-Google-Smtp-Source: APXvYqxg8oJfCrB6rT35TwAqrlE+eNFZgOxDecZBDGxnpVTQSuL28RbbNiQGrYbRCP4EiVLsJA/Rng==
X-Received: by 2002:adf:e4c6:: with SMTP id v6mr48788674wrm.315.1565767676859; 
 Wed, 14 Aug 2019 00:27:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a26sm2992739wmg.45.2019.08.14.00.27.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 00:27:56 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: Add printing for RW extracted from
 VM_L2_PROTECTION_FAULT_STATUS
To: "Zhao, Yong" <Yong.Zhao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190813180744.10901-1-Yong.Zhao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f4eee045-e4f3-c21b-a231-3417a1243800@gmail.com>
Date: Wed, 14 Aug 2019 09:27:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813180744.10901-1-Yong.Zhao@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JQdQag4Ifsbe/I89zEDNBojTSBr9rb7H5xpQ709Z2yY=;
 b=lRw/5v3B63MLl7Jov9ckQqa6sphR6dWkITnTxP32a2D1VlthPsVCdHoY3hFNEW5i6h
 l2X1l5MI4eRXPRDLqxU2ks2DXWpF8wbb97/nwKATnphWwUSzIw24VOYCS4Pe11cQ2r4c
 O6ZW5JXwC6wFORXLJWmp++qcV4IhL7cabijyc9M7T533O+L+V1PVhYi2fF6RTTW/sXqs
 IdFE6QcQq1UdwOaHdI0UqNzH4PjcHIhb4U9ebkiBOBbxcIp8U0fFew/EASYb7tpym/Fu
 iCpZWTLQJ2OSnc2VjuPi0AXplU7ommeRznVF5mo1xS4oD4z7fZ66WCWpTb94lbF8TkDK
 cLxQ==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTMuMDguMTkgdW0gMjA6MDggc2NocmllYiBaaGFvLCBZb25nOgo+IFJXIGlzIGFsc28gdXNl
ZnVsIGluIG1vc3QgY2FzZXMuCj4KPiBDaGFuZ2UtSWQ6IEljZjRiZDY1ZWExNjhlNTk2NWE2YThl
YmUzMmNlOTMyN2EyZGUyODUxCj4gU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9A
YW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMgfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4gaW5kZXggMjk2ZTJk
OTgyNTc4Li5lYzVlODU4OTI2YWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKPiBAQCAtMzg3LDYgKzM4Nyw5IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfcHJvY2Vzc19p
bnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCQlkZXZfZXJyKGFkZXYt
PmRldiwgIlx0IE1BUFBJTkdfRVJST1I6IDB4JWx4XG4iLAo+ICAgCQkJCVJFR19HRVRfRklFTEQo
c3RhdHVzLAo+ICAgCQkJCVZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBNQVBQSU5HX0VS
Uk9SKSk7Cj4gKwkJCWRldl9lcnIoYWRldi0+ZGV2LCAiXHQgUlc6IDB4JWx4XG4iLAo+ICsJCQkJ
UkVHX0dFVF9GSUVMRChzdGF0dXMsCj4gKwkJCQlWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRV
UywgUlcpKTsKPiAgIAo+ICAgCQl9Cj4gICAJfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
