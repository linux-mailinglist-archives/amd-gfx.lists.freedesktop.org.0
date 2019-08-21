Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6FB97C0C
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 16:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666166E42D;
	Wed, 21 Aug 2019 14:06:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59D26E42D
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 14:06:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so2171622wrr.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 07:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mw1aUEXMDkY1xYKOnkmieVLcsupz6Xdtl7k2siqfvAo=;
 b=Lalb++muEPVBmMT40XOPBycDux4VwTNkqDfMqXxNTWv/pB5nQlv3VbYNYBUFjsI3VX
 OqOyR9MU+kq1IlTn37uwv4d7lbwcwytBpXMI7AgbvuAoro7jGc5oMDHalmTyFFM6BS49
 ff2PDab0IaSQ6+850qKH5voh5Df67ZGyqN/otv9ZQMHUdWP+7ekeNC8gXn12DToZIfRs
 56O4sp7hEuGPhYRF5l0Bv1dozNCv3tPnK4twJDc35wAGk9HcnGugx/zlXc3qxQNsjmpn
 ylQZ3rI1pmjoWmondfJPE8e8r/Vmy+H8R7O31w7LT/NELFOwaexQT/gCBuhXi7oiNrNR
 yZsw==
X-Gm-Message-State: APjAAAWTd9M5O4H7k5XwV+gDf2okg8oGQF+Nu46F0oPKrgvGFd6FUVTz
 dGjy6NcW9th/9E+BJoVpeDva3U/Q
X-Google-Smtp-Source: APXvYqyk3sELM0HPsggH7DLPDVsWUNT0NpwEEBR6uBlSl9ZNMeGsGaeqw7e34mqY2g6y8nhcwks5UA==
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr41422794wrw.64.1566396400135; 
 Wed, 21 Aug 2019 07:06:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e11sm57851781wrc.4.2019.08.21.07.06.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 07:06:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: disable agp for sriov
To: "Frank.Min" <Frank.Min@amd.com>, amd-gfx@lists.freedesktop.org
References: <1566381635-6484-1-git-send-email-Frank.Min@amd.com>
 <1566381635-6484-2-git-send-email-Frank.Min@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9ccdfe53-a70c-a7ba-9714-7fcb10d50022@gmail.com>
Date: Wed, 21 Aug 2019 16:06:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566381635-6484-2-git-send-email-Frank.Min@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mw1aUEXMDkY1xYKOnkmieVLcsupz6Xdtl7k2siqfvAo=;
 b=TMTQ4T1pZFJZj0FAoT5ud2pPcx6GJhz9b22ZKTA9IwmWmig/OCg1SATjoShNQE1yAR
 GkI2s7AtJ0NJeVJsQAiUzgF+kgmiVZjUhiVTjwHG/d3Kg0rwG/DQKUxmm11hVkq3L3eB
 JvlJvm29Ai+dV7ymtYnTKxOmjH1RJ2RGU4rVd3L0RtSgaqRckWdLONlvq4EO0e04ePOx
 UQhmuZKmU8YU73SGCvurTa2YgIFPTCmzBwkjE9r1vLSbOoFfmYVig3Yg9HHxFtRQbiny
 2cZK+9JFkzFST4UQulDFkaCVgh6Qzs5IM+MEJ0pusQaD5OtbxXBGIwTUzL+q5A7210oF
 1yhQ==
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

QW0gMjEuMDguMTkgdW0gMTI6MDAgc2NocmllYiBGcmFuay5NaW46Cj4gU2luY2UgYWdwIGlzIG5v
dCB1c2VkIGZvciBzcmlvdiwganVzdCBkaXNhYmxlIGl0Cj4KPiBDaGFuZ2UtSWQ6IEkzYWE5NzUz
NDk5ZTJlNzRkOTgyYmI2MTEyMTRmOTRiZDU3YmQKCk1pc3NpbmcgU2lnbmVkLW9mLWJ5IGxpbmUg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKV2l0aCB0aGF0IGZpeGVkIFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IApmb3IgdGhlIHNlcmllcy4K
Cj4gY2Q5ZQo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5j
IHwgOCArKysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAg
IHwgMyArLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
bWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwo+IGluZGV4IDI1
MGQ5MjEuLjYwOTQ5OTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dtYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dt
Yy5jCj4gQEAgLTIxOCw2ICsyMTgsMTQgQEAgdm9pZCBhbWRncHVfZ21jX2FncF9sb2NhdGlvbihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9nbWMgKm1jKQo+ICAgCWNv
bnN0IHVpbnQ2NF90IHNpeHRlZW5fZ2JfbWFzayA9IH4oc2l4dGVlbl9nYiAtIDEpOwo+ICAgCXU2
NCBzaXplX2FmLCBzaXplX2JmOwo+ICAgCj4gKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7
Cj4gKwkJbWMtPmFncF9zdGFydCA9IDB4ZmZmZmZmZmY7Cj4gKwkJbWMtPmFncF9lbmQgPSAweDA7
Cj4gKwkJbWMtPmFncF9zaXplID0gMDsKPiArCj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsKPiAgIAlp
ZiAobWMtPmZiX3N0YXJ0ID4gbWMtPmdhcnRfc3RhcnQpIHsKPiAgIAkJc2l6ZV9iZiA9IChtYy0+
ZmJfc3RhcnQgJiBzaXh0ZWVuX2diX21hc2spIC0KPiAgIAkJCUFMSUdOKG1jLT5nYXJ0X2VuZCAr
IDEsIHNpeHRlZW5fZ2IpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+IGlu
ZGV4IDY4M2Y0N2QuLjZjZTI5NzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKPiBAQCAtOTMwLDggKzkzMCw3IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX3ZyYW1fZ3R0
X2xvY2F0aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCWJhc2UgKz0gYWRldi0+
Z21jLnhnbWkucGh5c2ljYWxfbm9kZV9pZCAqIGFkZXYtPmdtYy54Z21pLm5vZGVfc2VnbWVudF9z
aXplOwo+ICAgCWFtZGdwdV9nbWNfdnJhbV9sb2NhdGlvbihhZGV2LCBtYywgYmFzZSk7Cj4gICAJ
YW1kZ3B1X2dtY19nYXJ0X2xvY2F0aW9uKGFkZXYsIG1jKTsKPiAtCWlmICghYW1kZ3B1X3NyaW92
X3ZmKGFkZXYpKQo+IC0JCWFtZGdwdV9nbWNfYWdwX2xvY2F0aW9uKGFkZXYsIG1jKTsKPiArCWFt
ZGdwdV9nbWNfYWdwX2xvY2F0aW9uKGFkZXYsIG1jKTsKPiAgIAkvKiBiYXNlIG9mZnNldCBvZiB2
cmFtIHBhZ2VzICovCj4gICAJYWRldi0+dm1fbWFuYWdlci52cmFtX2Jhc2Vfb2Zmc2V0ID0gZ2Z4
aHViX3YxXzBfZ2V0X21jX2ZiX29mZnNldChhZGV2KTsKPiAgIAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
