Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C653F31309
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7D989664;
	Fri, 31 May 2019 16:51:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F76789664
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 16:51:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b18so6924471wrq.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 09:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0fYLpx+i4ZjiK/um67WxsKlrvUfh2ccSqc7/cpH6Rkk=;
 b=c2voCwicpeUA4VkjoPHLk4QtoJZ0MwBw5RBK0p3cZkVO2IpJHqAhuVt0uwXWXP7jPU
 qaMooE67iSbsW4y+VJy1tuf04PQil+usuaFgUJvM61X2PRiH23PPXlnlGWbmnTsieXhA
 GyVhxT91on5Qe+Ou23v6GoeRKPCUwQo5Cc8ikvnN6B76Laa0Wi5S/DQ511F3eLmkkTcH
 x7CkjaQqoAvmrBfbBwF/gBHjcMbAc1luh0oh7o/5sa2j65OAD7GFt1MV9RUTkrB4uCwW
 50fR6W+6dnILmrREKdPivyfLqTC7Mc9gv0eF0nrvfIzuyHQeMh3yXsFrYhsxSXE+oLVa
 x3oQ==
X-Gm-Message-State: APjAAAX+X5tGpQL4te+u2Pb9rjQD1cHw8osP0zl8JfUaghLwWoH+0/wy
 7Y/DvfOsbPHH+4xcWRndrvIOZD8S
X-Google-Smtp-Source: APXvYqy11mlh0P6bAGtEUHGMXSDz5G3G8z1CXwBEX2456JduUhkDEJHblVM/JokRegrC2xzlIoWhKQ==
X-Received: by 2002:adf:a749:: with SMTP id e9mr7417124wrd.64.1559320968439;
 Fri, 31 May 2019 09:42:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z13sm5478696wrw.42.2019.05.31.09.42.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 09:42:47 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/display: Drop some new
 CONFIG_DRM_AMD_DC_DCN1_01 guards
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190531163707.21363-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <681d75f6-95b3-4949-ffc3-b425ff671e08@gmail.com>
Date: Fri, 31 May 2019 18:42:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531163707.21363-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0fYLpx+i4ZjiK/um67WxsKlrvUfh2ccSqc7/cpH6Rkk=;
 b=c3EwK9tnhIlaboiLGKIWMp1QV5o3+ddSVZwVGmnEde+Fw4EUaLNR2IyjrJz6btM3Ga
 ntELO93Dlqrt6RyZyX+1WleWFgtswG2vTzBoPiHgFF5+nygIntOeqMYF3fajveMJVQWD
 Y4fNfvBVAvK7yZIzNrriDmV7NL0hhxgSrvzAKVOQ5TtVPpeXOReYm/EF1p1qOXB4VwH7
 UjiLDxPGzknqye5yl+IdkbMCRJhD+1GOpJVlAHU0SU+jBAs4z40CqyqGNqWJad7Nnqo/
 7Czja6VtZS8asknpFTdazmRWBcpIhAQ9Ipm+IvhUMIry76lXyZK4jZGOjm8ji2OjHtro
 gIbA==
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

QW0gMzEuMDUuMTkgdW0gMTg6Mzcgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gVGhlc2UgZ290IGFk
ZGVkIGJhY2sgYnkgc3Vic2VxdWVudCBtZXJnZXMgYWNjaWRlbnRseS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCkFja2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIgLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Nsa19tZ3IuYyAgfCA0IC0t
LS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGluZGV4IDMzZTM5
ODg4MjExYy4uYjVhNWNmYWU3YmExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTY2NSwxMyArNjY1LDExIEBAIHN0
YXRpYyBpbnQgbG9hZF9kbWN1X2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCWNh
c2UgQ0hJUF9WRUdBMjA6Cj4gICAJCXJldHVybiAwOwo+ICAgCWNhc2UgQ0hJUF9SQVZFTjoKPiAt
I2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMV8wMSkKPiAgIAkJaWYgKEFTSUNSRVZf
SVNfUElDQVNTTyhhZGV2LT5leHRlcm5hbF9yZXZfaWQpKQo+ICAgCQkJZndfbmFtZV9kbWN1ID0g
RklSTVdBUkVfUkFWRU5fRE1DVTsKPiAgIAkJZWxzZSBpZiAoQVNJQ1JFVl9JU19SQVZFTjIoYWRl
di0+ZXh0ZXJuYWxfcmV2X2lkKSkKPiAgIAkJCWZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVO
X0RNQ1U7Cj4gICAJCWVsc2UKPiAtI2VuZGlmCj4gICAJCQlyZXR1cm4gMDsKPiAgIAkJYnJlYWs7
Cj4gICAJZGVmYXVsdDoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Ns
a19tZ3IvY2xrX21nci5jCj4gaW5kZXggMDhiMjdjNzc1Y2Q0Li5lYjIyMDRkNDIzMzcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21nci5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21nci5j
Cj4gQEAgLTEwNSwxNCArMTA1LDEwIEBAIHN0cnVjdCBjbGtfbWdyICpkY19jbGtfbWdyX2NyZWF0
ZShzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LCBzdHJ1Y3QgcHBfc211X2Z1bmNzICpwCj4gICAKPiAg
ICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMCkKPiAgIAljYXNlIEZBTUlMWV9S
VjoKPiAtCj4gLSNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMDEpCj4gICAJCWlm
IChBU0lDUkVWX0lTX1JBVkVOMihhc2ljX2lkLmh3X2ludGVybmFsX3JldikpIHsKPiAgIAkJCXJ2
Ml9jbGtfbWdyX2NvbnN0cnVjdChjdHgsIGNsa19tZ3IsIHBwX3NtdSk7Cj4gICAJCQlicmVhazsK
PiAgIAkJfQo+IC0jZW5kaWYJLyogRENOMV8wMSAqLwo+IC0KPiAgIAkJaWYgKEFTSUNSRVZfSVNf
UkFWRU4oYXNpY19pZC5od19pbnRlcm5hbF9yZXYpIHx8Cj4gICAJCQkJQVNJQ1JFVl9JU19QSUNB
U1NPKGFzaWNfaWQuaHdfaW50ZXJuYWxfcmV2KSkgewo+ICAgCQkJcnYxX2Nsa19tZ3JfY29uc3Ry
dWN0KGN0eCwgY2xrX21nciwgcHBfc211KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
