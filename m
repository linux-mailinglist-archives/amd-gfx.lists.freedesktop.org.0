Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3A2935F
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 10:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4316E0A0;
	Fri, 24 May 2019 08:47:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C46E6E0A0
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 08:47:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 15so8326718wmg.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 01:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=VjdiSlDCmaiUWHT0CagxUj8kwX0IRMetGmIIaoKnqKA=;
 b=Lakw0Eu8dBChphJmM26IhPY2IKgN1V0rrpWKdy/GJiBRedOHmgOiiDShqd87lm6bJ+
 t5psTxmb34yYF+W4RmrwBchcXaVJeoInp42k3ilomr3UsLoJyvniFjK7+FCgBwIvjKwG
 qIYLCVWgT85Io/a/0xE4gCPy9Lsg4Owmi/fZqv+8Flt3gqSIT/EsdofOWIAWBFAVtKG3
 LTvxURs7f19uc/3I0BWADuwwFWhkDPi6WlgxAi36LT5SpgEN6vjn98ulcK3cS7LcPOiL
 vXhCzvz5PyWbRL1KyejxI7T7vzFC7dKMjKZZDL+Ls4SfPpIi3xe9KGbns9hrmM1dBdoJ
 +PXA==
X-Gm-Message-State: APjAAAXk6WKvaKIEdzooIkPi7uB5B6RUgktKkXiPafHgiZuibGdyUhpw
 ZRCndJDy8GMHM6X1QT4p4b8=
X-Google-Smtp-Source: APXvYqy7vPMwNYLXCj5guwZ+PzQcXfZHikbCMwC8e4fyBlNJhQun9j7v/GueHy7hDPpUIdF2dJymiw==
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr14558761wmh.32.1558687661964; 
 Fri, 24 May 2019 01:47:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q9sm3305563wmq.9.2019.05.24.01.47.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:47:41 -0700 (PDT)
Subject: Re: [PATCH 8/8] drm/amdkfd: Use kfd fd to mmap mmio
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-8-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0119ba18-c025-f331-d26e-2d12923f5e53@gmail.com>
Date: Fri, 24 May 2019 10:47:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558651263-3478-8-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VjdiSlDCmaiUWHT0CagxUj8kwX0IRMetGmIIaoKnqKA=;
 b=GS7sc24zI2hCgHq94/svcN3Jj454tAcX7cqoVYSkNWSaXskD/AMi9m4oACL+qNTyI5
 GDs22pykdH3TsMHWqZXHbgahouwlJQ54ch1qIUcqcjUx5IQUZmc97itqKhf1rnXbDqwL
 ra4HVQ5ONNOfaaOG1HC7KXaWWkLTlqR3xR1JfjcyqwLibJqgU/eUYRHdAgmeS1mYZCSS
 913qrBVexojAB5XbLxtNAodbDah1M0krx7mgn6fTzpxQYZaI/TFx+H2W5YKJ56uskthX
 baNZ18m6ZI9lQh/+zIPK7uOhbKOAWoV9bBViy0blmToyJFZMkdmWKKT0wXjndko1TgTI
 pOuw==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjQuMDUuMTkgdW0gMDA6NDEgc2NocmllYiBaZW5nLCBPYWs6Cj4gVFRNIGRvZXNuJ3Qgc3Vw
cG9ydCBDUFUgbWFwcGluZyBvZiBzZyB0eXBlIGJvICh1bmRlciB3aGljaAo+IG1taW8gYm8gaXMg
Y3JlYXRlZCkuIFN3aXRjaCBtbWFwaW5nIG9mIG1taW8gcGFnZSB0byBrZmQKPiBkZXZpY2UgZmls
ZS4KPgo+IENoYW5nZS1JZDogSTFhMWEyNGYyYWMwNjYyYmUzNzgzZDQ2MGMxMzc3MzFhZGUwMDdi
ODMKPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KCkFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyB8IDQ2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oICAgIHwgIDEgKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMKPiBpbmRleCA0NTVhM2Ri
Li42N2QyNjliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9j
aGFyZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5j
Cj4gQEAgLTEzMDksNiArMTMwOSwxNSBAQCBzdGF0aWMgaW50IGtmZF9pb2N0bF9hbGxvY19tZW1v
cnlfb2ZfZ3B1KHN0cnVjdCBmaWxlICpmaWxlcCwKPiAgIAlhcmdzLT5oYW5kbGUgPSBNQUtFX0hB
TkRMRShhcmdzLT5ncHVfaWQsIGlkcl9oYW5kbGUpOwo+ICAgCWFyZ3MtPm1tYXBfb2Zmc2V0ID0g
b2Zmc2V0Owo+ICAgCj4gKwkvKiBNTUlPIGlzIG1hcHBlZCB0aHJvdWdoIGtmZCBkZXZpY2UKPiAr
CSAqIEdlbmVyYXRlIGEga2ZkIG1tYXAgb2Zmc2V0Cj4gKwkgKi8KPiArCWlmIChmbGFncyAmIEtG
RF9JT0NfQUxMT0NfTUVNX0ZMQUdTX01NSU9fUkVNQVApIHsKPiArCQlhcmdzLT5tbWFwX29mZnNl
dCA9IEtGRF9NTUFQX1RZUEVfTU1JTyB8IEtGRF9NTUFQX0dQVV9JRChhcmdzLT5ncHVfaWQpOwo+
ICsJCWFyZ3MtPm1tYXBfb2Zmc2V0IDw8PSBQQUdFX1NISUZUOwo+ICsJCWFyZ3MtPm1tYXBfb2Zm
c2V0IHw9IGFtZGdwdV9hbWRrZmRfZ2V0X21taW9fcmVtYXBfcGh5c19hZGRyKGRldi0+a2dkKTsK
PiArCX0KPiArCj4gICAJcmV0dXJuIDA7Cj4gICAKPiAgIGVycl9mcmVlOgo+IEBAIC0xODgwLDYg
KzE4ODksMzkgQEAgc3RhdGljIGxvbmcga2ZkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlcCwgdW5z
aWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gICAJcmV0dXJuIHJldGNvZGU7Cj4g
ICB9Cj4gICAKPiArc3RhdGljIGludCBrZmRfbW1pb19tbWFwKHN0cnVjdCBrZmRfZGV2ICpkZXYs
IHN0cnVjdCBrZmRfcHJvY2VzcyAqcHJvY2VzcywKPiArCQkgICAgICBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkKPiArewo+ICsJcGh5c19hZGRyX3QgYWRkcmVzczsKPiArCWludCByZXQ7Cj4g
Kwo+ICsJaWYgKHZtYS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydCAhPSBQQUdFX1NJWkUpCj4gKwkJ
cmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJYWRkcmVzcyA9IGFtZGdwdV9hbWRrZmRfZ2V0X21taW9f
cmVtYXBfcGh5c19hZGRyKGRldi0+a2dkKTsKPiArCj4gKwl2bWEtPnZtX2ZsYWdzIHw9IFZNX0lP
IHwgVk1fRE9OVENPUFkgfCBWTV9ET05URVhQQU5EIHwgVk1fTk9SRVNFUlZFIHwKPiArCQkJCVZN
X0RPTlREVU1QIHwgVk1fUEZOTUFQOwo+ICsKPiArCXZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90
X25vbmNhY2hlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7Cj4gKwo+ICsJcHJfZGVidWcoIlByb2Nlc3Mg
JWQgbWFwcGluZyBtbWlvIHBhZ2VcbiIKPiArCQkgIiAgICAgdGFyZ2V0IHVzZXIgYWRkcmVzcyA9
PSAweCUwOGxsWFxuIgo+ICsJCSAiICAgICBwaHlzaWNhbCBhZGRyZXNzICAgID09IDB4JTA4bGxY
XG4iCj4gKwkJICIgICAgIHZtX2ZsYWdzICAgICAgICAgICAgPT0gMHglMDRsWFxuIgo+ICsJCSAi
ICAgICBzaXplICAgICAgICAgICAgICAgID09IDB4JTA0bFhcbiIsCj4gKwkJIHByb2Nlc3MtPnBh
c2lkLCAodW5zaWduZWQgbG9uZyBsb25nKSB2bWEtPnZtX3N0YXJ0LAo+ICsJCSBhZGRyZXNzLCB2
bWEtPnZtX2ZsYWdzLCBQQUdFX1NJWkUpOwo+ICsKPiArCXJldCA9IGlvX3JlbWFwX3Bmbl9yYW5n
ZSh2bWEsCj4gKwkJCQl2bWEtPnZtX3N0YXJ0LAo+ICsJCQkJYWRkcmVzcyA+PiBQQUdFX1NISUZU
LAo+ICsJCQkJUEFHRV9TSVpFLAo+ICsJCQkJdm1hLT52bV9wYWdlX3Byb3QpOwo+ICsJcmV0dXJu
IHJldDsKPiArfQo+ICsKPiArCj4gICBzdGF0aWMgaW50IGtmZF9tbWFwKHN0cnVjdCBmaWxlICpm
aWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgIHsKPiAgIAlzdHJ1Y3Qga2ZkX3By
b2Nlc3MgKnByb2Nlc3M7Cj4gQEAgLTE5MTAsNiArMTk1MiwxMCBAQCBzdGF0aWMgaW50IGtmZF9t
bWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgIAkJ
aWYgKCFkZXYpCj4gICAJCQlyZXR1cm4gLUVOT0RFVjsKPiAgIAkJcmV0dXJuIGtmZF9yZXNlcnZl
ZF9tZW1fbW1hcChkZXYsIHByb2Nlc3MsIHZtYSk7Cj4gKwljYXNlIEtGRF9NTUFQX1RZUEVfTU1J
TzoKPiArCQlpZiAoIWRldikKPiArCQkJcmV0dXJuIC1FTk9ERVY7Cj4gKwkJcmV0dXJuIGtmZF9t
bWlvX21tYXAoZGV2LCBwcm9jZXNzLCB2bWEpOwo+ICAgCX0KPiAgIAo+ICAgCXJldHVybiAtRUZB
VUxUOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAo+IGluZGV4IDQwYTVjNjcu
LmI2MWRjNTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3By
aXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKPiBAQCAt
NTksNiArNTksNyBAQAo+ICAgI2RlZmluZSBLRkRfTU1BUF9UWVBFX0RPT1JCRUxMCSgweDNVTEwg
PDwgS0ZEX01NQVBfVFlQRV9TSElGVCkKPiAgICNkZWZpbmUgS0ZEX01NQVBfVFlQRV9FVkVOVFMJ
KDB4MlVMTCA8PCBLRkRfTU1BUF9UWVBFX1NISUZUKQo+ICAgI2RlZmluZSBLRkRfTU1BUF9UWVBF
X1JFU0VSVkVEX01FTQkoMHgxVUxMIDw8IEtGRF9NTUFQX1RZUEVfU0hJRlQpCj4gKyNkZWZpbmUg
S0ZEX01NQVBfVFlQRV9NTUlPCSgweDBVTEwgPDwgS0ZEX01NQVBfVFlQRV9TSElGVCkKPiAgIAo+
ICAgI2RlZmluZSBLRkRfTU1BUF9HUFVfSURfU0hJRlQgKDQ2IC0gUEFHRV9TSElGVCkKPiAgICNk
ZWZpbmUgS0ZEX01NQVBfR1BVX0lEX01BU0sgKCgoMVVMTCA8PCBLRkRfR1BVX0lEX0hBU0hfV0lE
VEgpIC0gMSkgXAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
