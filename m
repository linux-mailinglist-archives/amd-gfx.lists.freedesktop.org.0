Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663DC482F
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 09:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BD96E0C0;
	Wed,  2 Oct 2019 07:17:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F06E0C0
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 07:17:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n14so18271436wrw.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Oct 2019 00:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=HybiYp+LL29vzfkVUNdOGYkJ2G29pwU4cv3y/VpsKoU=;
 b=tI3IGbjuA6AjHSWk/aUoiCQSaF895fx4WpF1cmx9u1UiwJKVDGYYPDw/WIwJFiCuHl
 2JRJ874LOm4dEyCQgUGBfvDxBlv5sYtclHANxNP6lVvwNdKXuPRDhzcmicFjEZzzzXLE
 y2zOshwwsShes0UW+uovLmSvA5kGLLgy3CmvRgCRPvYtfr01mypQCSl7FzFFGsqzybN/
 7okBrUc/z8QAUFz+6f9JDlzVASJ6DC+39cZGhDBuwuwMm8IZN6gi1U9mv6iV3tb+F0ef
 za2qwCbIWCEan8gK71pCW3VxYkwSBuBMquJYbkgNwIMBt1aSDAaUGrItD85L9AJm5b2v
 M3jA==
X-Gm-Message-State: APjAAAX8EwVeczY0fNRywu1nKlv7q+5jtyAXkDZEK7BzyTVtBql4xET+
 HgFrcC1QdgIDAFmEliDiy9ifZotm
X-Google-Smtp-Source: APXvYqzxov2mu1AngR4Yc+SWJcJkN7BYbdZIZpceItKL6LHxIkPLJ1BZbKRgeV0ESkwRz9R0i4gIJQ==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr1495555wrp.216.1570000666336; 
 Wed, 02 Oct 2019 00:17:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c10sm29316066wrf.58.2019.10.02.00.17.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 00:17:45 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: don't increment vram lost if we are in
 hibernation
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20191001214829.24634-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <26ef3ab7-9548-8500-48c1-43da117e00d8@gmail.com>
Date: Wed, 2 Oct 2019 09:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001214829.24634-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HybiYp+LL29vzfkVUNdOGYkJ2G29pwU4cv3y/VpsKoU=;
 b=dIlwIF7sDYsFLJa588kiw/fncAq5vrYyrSsZOVpRb4mU/xqnGkO7HwQCSJUCO5buZe
 BVI9mKGb0UX8/3weBXykpGkXcxg41IRMMUup8W8PR/bVBR+45xW61X5BHkaFXWb3R11O
 83s+463JHjEKr6gdP4H9Dxdzeku0P8DV03QdEe8A38+ZJjo7/fwQW2XC7wXRYexgbwhy
 4C+B+dhB2jBrlZAFmBBmlXJ0dZj+7cgOToLj9JWmmvsbViKFCWk1cETnkdYECzlpsxlO
 deTeblF5RMtj+iG6Mr9NyyxsAGeQa6EXbX0hHXouNYSpRyU/5oeYNgKFB4rRxYIkgwth
 6Avg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDEuMTAuMTkgdW0gMjM6NDggc2NocmllYiBBbGV4IERldWNoZXI6Cj4gV2UgcmVzZXQgdGhl
IEdQVSBhcyBwYXJ0IG9mIG91ciBoaWJlcm5hdGlvbiBzZXF1ZW5jZSBzbyB3ZSBuZWVkCj4gdG8g
bWFrZSBzdXJlIHdlIGRvbid0IG1hcmsgdnJhbSBhcyBsb3N0IGluIHRoYXQgY2FzZS4KPgo+IEJ1
ZzogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExODc5Cj4g
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoK
QWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4g
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jICAgIHwgNiArKysrLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA2ICsrKystLQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L252LmMKPiBpbmRleCBiM2U3NzU2ZmNjNGIuLjE3ZGMwNTRhNGI2YyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbnYuYwo+IEBAIC0zMTksMTAgKzMxOSwxMiBAQCBzdGF0aWMgaW50IG52
X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUgPSAmYWRldi0+c211Owo+ICAgCj4gICAJaWYgKG52X2FzaWNfcmVzZXRfbWV0
aG9kKGFkZXYpID09IEFNRF9SRVNFVF9NRVRIT0RfQkFDTykgewo+IC0JCWFtZGdwdV9pbmNfdnJh
bV9sb3N0KGFkZXYpOwo+ICsJCWlmICghYWRldi0+aW5fc3VzcGVuZCkKPiArCQkJYW1kZ3B1X2lu
Y192cmFtX2xvc3QoYWRldik7Cj4gICAJCXJldCA9IHNtdV9iYWNvX3Jlc2V0KHNtdSk7Cj4gICAJ
fSBlbHNlIHsKPiAtCQlhbWRncHVfaW5jX3ZyYW1fbG9zdChhZGV2KTsKPiArCQlpZiAoIWFkZXYt
PmluX3N1c3BlbmQpCj4gKwkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOwo+ICAgCQlyZXQg
PSBudl9hc2ljX21vZGUxX3Jlc2V0KGFkZXYpOwo+ICAgCX0KPiAgIAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc29jMTUuYwo+IGluZGV4IGI1MjQwYjVkYmY3Yi4uODhhNDlhNjhjNjdmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCj4gQEAgLTU2NCwxMiArNTY0LDE0IEBAIHN0YXRp
YyBpbnQgc29jMTVfYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsK
PiAgIAlzd2l0Y2ggKHNvYzE1X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYpKSB7Cj4gICAJCWNhc2Ug
QU1EX1JFU0VUX01FVEhPRF9CQUNPOgo+IC0JCQlhbWRncHVfaW5jX3ZyYW1fbG9zdChhZGV2KTsK
PiArCQkJaWYgKCFhZGV2LT5pbl9zdXNwZW5kKQo+ICsJCQkJYW1kZ3B1X2luY192cmFtX2xvc3Qo
YWRldik7Cj4gICAJCQlyZXR1cm4gc29jMTVfYXNpY19iYWNvX3Jlc2V0KGFkZXYpOwo+ICAgCQlj
YXNlIEFNRF9SRVNFVF9NRVRIT0RfTU9ERTI6Cj4gICAJCQlyZXR1cm4gc29jMTVfbW9kZTJfcmVz
ZXQoYWRldik7Cj4gICAJCWRlZmF1bHQ6Cj4gLQkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYp
Owo+ICsJCQlpZiAoIWFkZXYtPmluX3N1c3BlbmQpCj4gKwkJCQlhbWRncHVfaW5jX3ZyYW1fbG9z
dChhZGV2KTsKPiAgIAkJCXJldHVybiBzb2MxNV9hc2ljX21vZGUxX3Jlc2V0KGFkZXYpOwo+ICAg
CX0KPiAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
