Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156BD3B62
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 10:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF266EBCB;
	Fri, 11 Oct 2019 08:40:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFB26EBCB
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 08:40:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so9341185wmi.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cbStGA09vMNbmC9SZ3U+vG5P/xL7MONRl8gkTVKojJM=;
 b=K4kwWRyD9FQxnJrVIFIEnm8ccGV4MKBe2o3mTGMcNyLd7Ks2PquBMbRQOsKxA3o13l
 Y0i/6TI3YlDeTfHVludDer49BgUUCkvvbEyLo6fgNd6So/2TBNdio82lCMxrzDY0TXEN
 GtkBvugC2QMXxv8w26R9wLoL2RSei5X5B31Je+FddCWQD1OF4gtq5vC1ytN1k93eRIMg
 MSlJU2dnHoukwB7gn7WgcuJg0xXTDAdI1LSAEaa8C3d8zA9HhiS36963du0MlqEhvPk9
 KOqLt4VpKKjDRp6wD5P0ODt1KRMBBc4EjYwD48HHKKUSTlcBgUm4LfYbygTNSqavFBhD
 slJg==
X-Gm-Message-State: APjAAAW6UcNQ1kOqo6EdPh0Nwdn6bg30C3Z0zuumlmrwtbe470iE3yc3
 x78IjlakIxLre/6Mt7eQJwf/GDcz
X-Google-Smtp-Source: APXvYqzw68w0NeXaaxIICnHUjZWdEUPKGYhCWp8UoYJLRp9wLOXOYfReCXGByL87qAiwdSGBOt0p+A==
X-Received: by 2002:a1c:b4c2:: with SMTP id d185mr2048298wmf.159.1570783229737; 
 Fri, 11 Oct 2019 01:40:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n1sm11526670wrg.67.2019.10.11.01.40.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Oct 2019 01:40:29 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: user pages array memory leak fix
To: "Yang, Philip" <Philip.Yang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "thej^C@gmail.com" <thej^C@gmail.com>
References: <20191003194423.14468-1-Philip.Yang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <af664c43-a81b-bae4-8f6f-c70bc4ab9de5@gmail.com>
Date: Fri, 11 Oct 2019 10:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003194423.14468-1-Philip.Yang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cbStGA09vMNbmC9SZ3U+vG5P/xL7MONRl8gkTVKojJM=;
 b=HvAzv3nN3JMZ5pA5e4X9THjvm/1e9ppcvqGhq2uJlYflO1w/OInHunJMAzyWDgmrKL
 n910+SLLEFnOhteiC99/6b62+7w0iOlUOgjqreNuvZlyKBFvuID/SevfQ+aSsE23gicD
 o292R23XTcorhOlPQKv4yrRbLXHTBHFlSXB03MAF0XcTiYkC0Siu5PliTVgvhJXx1jvq
 hwFxP7N0zGu/Bx+iHY1XGSs8tneO+Q48YQvZ0iVW/z7RDpx0Nvqan9bSnTN5y9mCHCFl
 CVEhxTUeoHn1XXJkFMQlfVYxC+y6yJheN4edTXyvgYgiKEhJeXITCLyKWznpBxxEUaO8
 1HLA==
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

QW0gMDMuMTAuMTkgdW0gMjE6NDQgc2NocmllYiBZYW5nLCBQaGlsaXA6Cj4gdXNlcl9wYWdlcyBh
cnJheSBzaG91bGQgYWx3YXlzIGJlIGZyZWVkIGFmdGVyIHZhbGlkYXRpb24gcmVnYXJkbGVzcyBp
Zgo+IHVzZXIgcGFnZXMgYXJlIGNoYW5nZWQgYWZ0ZXIgYm8gaXMgY3JlYXRlZCBiZWNhdXNlIHdp
dGggSE1NIGNoYW5nZSBwYXJzZQo+IGJvIGFsd2F5cyBhbGxvY2F0ZSB1c2VyIHBhZ2VzIGFycmF5
IHRvIGdldCB1c2VyIHBhZ2VzIGZvciB1c2VycHRyIGJvLgo+Cj4gRG9uJ3QgbmVlZCB0byBnZXQg
dXNlciBwYWdlcyB3aGlsZSBjcmVhdGluZyB1ZXJwdHIgYm8gYmVjYXVzZSB1c2VyIHBhZ2VzCj4g
d2lsbCBvbmx5IGJlIHVzZWQgd2hpbGUgdmFsaWRhdGluZyBhZnRlciBwYXJzaW5nIHVzZXJwdHIg
Ym8uCj4KPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3Vy
Y2UvbGludXgvK2J1Zy8xODQ0OTYyCj4KPiB2MjogcmVtb3ZlIHVudXNlZCBsb2NhbCB2YXJpYWJs
ZSBhbmQgYW1lbmQgY29tbWl0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlw
LllhbmdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jICB8ICA0ICstLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYyB8IDIzICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3MuYwo+IGluZGV4IDQ5Yjc2N2I3MjM4Zi4uOTYxMTg2ZTcxMTNlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiBAQCAtNDc0LDcgKzQ3NCw2IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJz
ZXIgKnAsCj4gICAKPiAgIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGxvYmosIHZhbGlkYXRlZCwgdHYu
aGVhZCkgewo+ICAgCQlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IHR0bV90b19hbWRncHVfYm8obG9i
ai0+dHYuYm8pOwo+IC0JCWJvb2wgYmluZGluZ191c2VycHRyID0gZmFsc2U7Cj4gICAJCXN0cnVj
dCBtbV9zdHJ1Y3QgKnVzZXJtbTsKPiAgIAo+ICAgCQl1c2VybW0gPSBhbWRncHVfdHRtX3R0X2dl
dF91c2VybW0oYm8tPnRiby50dG0pOwo+IEBAIC00OTEsMTQgKzQ5MCwxMyBAQCBzdGF0aWMgaW50
IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAo+ICAg
Cj4gICAJCQlhbWRncHVfdHRtX3R0X3NldF91c2VyX3BhZ2VzKGJvLT50Ym8udHRtLAo+ICAgCQkJ
CQkJICAgICBsb2JqLT51c2VyX3BhZ2VzKTsKPiAtCQkJYmluZGluZ191c2VycHRyID0gdHJ1ZTsK
PiAgIAkJfQo+ICAgCj4gICAJCXIgPSBhbWRncHVfY3NfdmFsaWRhdGUocCwgYm8pOwo+ICAgCQlp
ZiAocikKPiAgIAkJCXJldHVybiByOwo+ICAgCj4gLQkJaWYgKGJpbmRpbmdfdXNlcnB0cikgewo+
ICsJCWlmIChsb2JqLT51c2VyX3BhZ2VzKSB7Cj4gICAJCQlrdmZyZWUobG9iai0+dXNlcl9wYWdl
cyk7Cj4gICAJCQlsb2JqLT51c2VyX3BhZ2VzID0gTlVMTDsKPiAgIAkJfQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPiBpbmRleCBhODI4ZTNkMGJmYmQuLjNjY2Q2MWQ2
OTk2NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Vt
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPiBAQCAt
MjgzLDcgKzI4Myw2IEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAgaW50IGFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAgCQkJICAgICBzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbHApCj4gICB7Cj4gLQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0geyB0
cnVlLCBmYWxzZSB9Owo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGV2LT5kZXZf
cHJpdmF0ZTsKPiAgIAlzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fdXNlcnB0ciAqYXJncyA9IGRhdGE7
Cj4gICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnb2JqOwo+IEBAIC0zMjYsMzIgKzMyNSwxMiBA
QCBpbnQgYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgKmRhdGEsCj4gICAJCQlnb3RvIHJlbGVhc2Vfb2JqZWN0Owo+ICAgCX0KPiAgIAo+IC0JaWYg
KGFyZ3MtPmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX1ZBTElEQVRFKSB7CgpXZSBjYW4ndCBk
cm9wIHRoYXQgaGFuZGxpbmcgaGVyZSwgaXQgaXMgbWFuZGF0b3J5IHRvIGRldGVjdCBhbiAKYXBw
bGljYXRpb24gYnVnIHdoZXJlIGFuIGFwcGxpY2F0aW9uIHRyaWVzIHRvIHVzZXIgYW4gdXNlcnB0
ciB3aXRoIGEgVk1BIAp3aGljaCBpcyBub3QgYW5vbnltb3VzIG1lbW9yeS4KClRoaXMgbXVzdCBi
ZSBkZXRlY3RlZCBhbmQgcmVqZWN0ZWQgYXMgaW52YWxpZCBoZXJlLgoKSSBzdWdnZXN0IHRoYXQg
d2UgYWxsb2NhdGUgYSBsb2NhbCBwYWdlcyBhcnJheSBzaW1pbGFyIHRvIGhvdyB3ZSBkbyBpdCAK
ZHVyaW5nIENTIGFuZCByZWxlYXNlIHRoYXQgYWZ0ZXIgdGhlIGZ1bmN0aW9uIGlzIGRvbmUuCgpS
ZWdhcmRzLApDaHJpc3RpYW4uCgo+IC0JCXIgPSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2Vz
KGJvLCBiby0+dGJvLnR0bS0+cGFnZXMpOwo+IC0JCWlmIChyKQo+IC0JCQlnb3RvIHJlbGVhc2Vf
b2JqZWN0Owo+IC0KPiAtCQlyID0gYW1kZ3B1X2JvX3Jlc2VydmUoYm8sIHRydWUpOwo+IC0JCWlm
IChyKQo+IC0JCQlnb3RvIHVzZXJfcGFnZXNfZG9uZTsKPiAtCj4gLQkJYW1kZ3B1X2JvX3BsYWNl
bWVudF9mcm9tX2RvbWFpbihibywgQU1ER1BVX0dFTV9ET01BSU5fR1RUKTsKPiAtCQlyID0gdHRt
X2JvX3ZhbGlkYXRlKCZiby0+dGJvLCAmYm8tPnBsYWNlbWVudCwgJmN0eCk7Cj4gLQkJYW1kZ3B1
X2JvX3VucmVzZXJ2ZShibyk7Cj4gLQkJaWYgKHIpCj4gLQkJCWdvdG8gdXNlcl9wYWdlc19kb25l
Owo+IC0JfQo+IC0KPiAgIAlyID0gZHJtX2dlbV9oYW5kbGVfY3JlYXRlKGZpbHAsIGdvYmosICZo
YW5kbGUpOwo+ICAgCWlmIChyKQo+IC0JCWdvdG8gdXNlcl9wYWdlc19kb25lOwo+ICsJCWdvdG8g
cmVsZWFzZV9vYmplY3Q7Cj4gICAKPiAgIAlhcmdzLT5oYW5kbGUgPSBoYW5kbGU7Cj4gICAKPiAt
dXNlcl9wYWdlc19kb25lOgo+IC0JaWYgKGFyZ3MtPmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRS
X1ZBTElEQVRFKQo+IC0JCWFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZShiby0+dGJv
LnR0bSk7Cj4gLQo+ICAgcmVsZWFzZV9vYmplY3Q6Cj4gICAJZHJtX2dlbV9vYmplY3RfcHV0X3Vu
bG9ja2VkKGdvYmopOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
