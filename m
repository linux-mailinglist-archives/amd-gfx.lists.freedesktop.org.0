Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2162ED8C11
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 11:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A8E89AC2;
	Wed, 16 Oct 2019 09:01:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA1B89AC2
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 09:01:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r3so27082328wrj.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=62syhToS46ee+QEg4IiDiUNclIAiYy5LazRhRBAKsBk=;
 b=cX/NhGG4X4FQOy0p3oWZzpumwxMSyRAL0UenRfnrPxgSEbL+1T5FHh0XqeRcZbKD0F
 DLuRXsBGDLY/BspK9GlOzACXT8owbAvus7SZvDIQOqaDOcpOA7Fo4jUVnvDD8cU3nkwK
 76EBDud/vvAOmigekLeJSm81DR7XW1HHib5AyGOIYs9cCl6C1NhDidVdIOcbZMTz6gHW
 OexOfe5IXtJKkHAhhJeEY+xgL0ccAG7bKdrQOZozNjOL0MwFYXjRlO4L0MbxQv6O2ndl
 3ZIDdE6p5wNot8g1o4Bf0Gn8mp63TbnAb3ukCrrpUpY3Jf4qGviUx1rnQGHx9YFwucRp
 /onw==
X-Gm-Message-State: APjAAAWNwf4WQN3N18zo1sS9Fe6CN7qqK9LauCNdKcsk4FW3D8XpSwt9
 Eak7CS69ipiJCUIpDbA6bOgVOske
X-Google-Smtp-Source: APXvYqxwHoos1koTw4iedxOYfv2Lx4mpXdCLzmg+gsFIxYwiCPRTvwHKaxzpZ5157GitjRj2Gak6HA==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr1695069wro.305.1571216477703; 
 Wed, 16 Oct 2019 02:01:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u11sm1690112wmd.32.2019.10.16.02.01.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 02:01:17 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/amdgpu/uvd:Allocate enc session bo for uvd7.0
 ring IB test
To: "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
 <1571177279-9435-4-git-send-email-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1e95326e-3015-3a47-99c1-e44c826171db@gmail.com>
Date: Wed, 16 Oct 2019 11:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571177279-9435-4-git-send-email-James.Zhu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=62syhToS46ee+QEg4IiDiUNclIAiYy5LazRhRBAKsBk=;
 b=rIgeVvlhMhWLSaJUfOasCdZOAlyM5QcaiUfZhZU3HYAPtmBXaSyE6F7oWbiiiWpeNp
 Dxb0J2lTXGHRbbGav3wM+g+5Q8UViHC0NWjb/yXjZEO9yIf3ireBoG7GZspfDVSHcaqh
 mnRRcgCJ2Ll5nppmd49gFkeMHCM3xiUin6AFYSGP+zJgTp7qg+1TsBhUk00P/P8gdeos
 Zz7DkSBj7tbqC/1KxGY9amWh44weFYdXQnUMbrbGPZpBAbjR8Kqj0MkqYbx1td9ZmmXw
 Th/5v7CiHJRToP+kZsM+q2Lo96XvzCp52Zbr6GINWH7Zd/ANAOhebG12YTs6iwV3QqnF
 8+VA==
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

QW0gMTYuMTAuMTkgdW0gMDA6MDggc2NocmllYiBaaHUsIEphbWVzOgo+IEFsbG9jYXRlIDI1Nksg
ZW5jIHNlc3Npb24gYm8gZm9yIHV2ZDYuMCByaW5nIElCIHRlc3QgdG8gZml4IFMzIHJlc3VtZQo+
IGNvcnJ1cHRpb24gaXNzdWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpo
dUBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAu
YyB8IDE2ICsrKysrKysrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3V2ZF92N18wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5j
Cj4gaW5kZXggMDFmNjU4Zi4uMWIxN2ZjOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjdfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dXZkX3Y3XzAuYwo+IEBAIC0yMjgsNyArMjI4LDcgQEAgc3RhdGljIGludCB1dmRfdjdfMF9lbmNf
Z2V0X2NyZWF0ZV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUK
PiAgIAkJcmV0dXJuIHI7Cj4gICAKPiAgIAlpYiA9ICZqb2ItPmlic1swXTsKPiAtCWR1bW15ID0g
aWItPmdwdV9hZGRyICsgMTAyNDsKPiArCWR1bW15ID0gcmluZy0+YWRldi0+dmNuLmVuY19zZXNz
aW9uX2dwdV9hZGRyOwo+ICAgCj4gICAJaWItPmxlbmd0aF9kdyA9IDA7Cj4gICAJaWItPnB0cltp
Yi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsKPiBAQCAtMjg5LDcgKzI4OSw3IEBAIHN0YXRp
YyBpbnQgdXZkX3Y3XzBfZW5jX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJp
bmcsIHVpbnQzMl90IGhhbmRsCj4gICAJCXJldHVybiByOwo+ICAgCj4gICAJaWIgPSAmam9iLT5p
YnNbMF07Cj4gLQlkdW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7Cj4gKwlkdW1teSA9IHJpbmct
PmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ncHVfYWRkciArIDEyOCAqIFBBR0VfU0laRTsKPiAgIAo+
ICAgCWliLT5sZW5ndGhfZHcgPSAwOwo+ICAgCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4
MDAwMDAwMTg7Cj4gQEAgLTMzMyw5ICszMzMsMTYgQEAgc3RhdGljIGludCB1dmRfdjdfMF9lbmNf
Z2V0X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGwK
PiAgICAqLwo+ICAgc3RhdGljIGludCB1dmRfdjdfMF9lbmNfcmluZ190ZXN0X2liKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KQo+ICAgewo+ICsJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Owo+ICAgCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0g
TlVMTDsKPiAgIAlsb25nIHI7Cj4gICAKPiArCXIgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChh
ZGV2LCAyICogMTI4LCBQQUdFX1NJWkUsCj4gKwkJCUFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sICZh
ZGV2LT52Y24uZW5jX3Nlc3Npb25fYm8sCj4gKwkJCSZhZGV2LT52Y24uZW5jX3Nlc3Npb25fZ3B1
X2FkZHIsICZhZGV2LT52Y24uZW5jX3Nlc3Npb25fY3B1X2FkZHIpOwo+ICsJaWYgKHIpCj4gKwkJ
cmV0dXJuIHI7Cj4gKwoKTG9va3MgbGlrZSB5b3UgYWN0dWFsbHkgZG8gYWxsb2NhdGUgdGhhdCBv
biBkZW1hbmQsIGJ1dCBwbGVhc2UgZG9uJ3QgcHV0IAp0aGUgYm8gYW5kIGFkZHJlc3NlcyBpbnRv
IHRoZSBhZGV2LT52Y24gc3RydWN0dXJlLiBJdCBpcyBvbmx5IHZhbGlkIAp0ZW1wb3JhcnkuCgpS
ZWdhcmRzLApDaHJpc3RpYW4uCgo+ICAgCXIgPSB1dmRfdjdfMF9lbmNfZ2V0X2NyZWF0ZV9tc2co
cmluZywgMSwgTlVMTCk7Cj4gICAJaWYgKHIpCj4gICAJCWdvdG8gZXJyb3I7Cj4gQEAgLTM1Miw2
ICszNTksMTEgQEAgc3RhdGljIGludCB1dmRfdjdfMF9lbmNfcmluZ190ZXN0X2liKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KQo+ICAgCj4gICBlcnJvcjoKPiAgIAlkbWFf
ZmVuY2VfcHV0KGZlbmNlKTsKPiArCj4gKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPnZj
bi5lbmNfc2Vzc2lvbl9ibywKPiArCQkJCSAgJmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ncHVfYWRk
ciwKPiArCQkJCSAgKHZvaWQgKiopJmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9jcHVfYWRkcik7Cj4g
Kwo+ICAgCXJldHVybiByOwo+ICAgfQo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
