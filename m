Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B0B91AF
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 16:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB326FD0C;
	Fri, 20 Sep 2019 14:25:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BD86FD0D
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 14:25:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p7so2720478wmp.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 07:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=iA7eagZ9bUkldbMNuicQWZGy4ADfd0tx12/SbqH0NdY=;
 b=r5Fx4UTSylDRFBJz/mWIf/sh6DuAiJUSJOlY0q6mXEnLSBjBWYcVENayQxk2kwP74z
 AC2TA3BtRQn8Lo9UigjGPECr6hQDaIouTOrVK1/sKxyITC4Hig0iCrRU1JtnHNgVIJGp
 J+vunwW8/MYZ39VPoVak3U4NT3ZGemAi9FGfruJJ5J1go3vdu06a5NQDC5dn3LlRIsST
 qPlCy/ZLJixlqe1+SPCvtMIY28iSPGQcuiUN/I4Oek6rJV0Jur/Q5QtCBSMj/vTXae//
 qos4q2Adfo89yXEq9LMV/NciqbnwjG7vbR6ZsGBmbGT0OWrhe6s21WICUEbiRXeVE+Yq
 h8MQ==
X-Gm-Message-State: APjAAAXXdZJDFY0wXUemGcfcuhnYJyT2z7ByCSGrXJIyH4NGx1r5yOvD
 WqDbNubijvGQBok6a34KN8Y=
X-Google-Smtp-Source: APXvYqwvLFCWFmZZ8VcLiRPiVulQUd4hPFtbxXuRFtLdhhRB24X6pieHTOiAML8ONuzk6DuSgWvLrg==
X-Received: by 2002:a7b:c088:: with SMTP id r8mr4023510wmh.44.1568989501207;
 Fri, 20 Sep 2019 07:25:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j26sm3165252wrd.2.2019.09.20.07.25.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 07:25:00 -0700 (PDT)
Subject: Re: [PATCH 3/6] drm/amdgpu/vm: fix up documentation in amdgpu_vm.c
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190919214527.10803-1-alexander.deucher@amd.com>
 <20190919214527.10803-3-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <041df7b8-cb54-d8f6-94c7-1b2db14f4090@gmail.com>
Date: Fri, 20 Sep 2019 16:24:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919214527.10803-3-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iA7eagZ9bUkldbMNuicQWZGy4ADfd0tx12/SbqH0NdY=;
 b=EEqGTf18nd/84+kxj8GoZMkIB3Vwsk8uNVID7U2vkEK6ijamAjxxqevIg8TEX/mDu0
 UWRMSXzDFzACRCCWBRy4eukETICxy+jg5UNO8Lm9pLO30nd5ReyUobrBoGExBHMQG+tu
 BViQrYTFcPsyXZhtMTy/BsQIWbStBkr2TD3S1VmQATzq78szVlN2Xi/VrKNh0zNWj3Vt
 NEbqHYKwJqMxvnklPovWnb83nxnA1ULgRYRiDRxbiHCVOfDMabAnCxLZ6ck4wztlJcZp
 J7Yp8zndNQKm9OIoZKJ3gBQpv1LtZlRkf9++589bbOMtRXybH1mcIlnVfz9Tk8eb380U
 c7dg==
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

QW0gMTkuMDkuMTkgdW0gMjM6NDUgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gTWlzc2luZyBwYXJh
bWV0ZXJzLCB3cm9uZyBjb21tZW50IHR5cGUsIGV0Yy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBpbmRleCAyYmI1MzE5MWY2NTUuLmEyYzc5
N2UzNGEyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gQEAg
LTM0Miw3ICszNDIsNyBAQCBzdGF0aWMgc3RydWN0IGFtZGdwdV92bV9wdCAqYW1kZ3B1X3ZtX3B0
X3BhcmVudChzdHJ1Y3QgYW1kZ3B1X3ZtX3B0ICpwdCkKPiAgIAlyZXR1cm4gY29udGFpbmVyX29m
KHBhcmVudC0+dm1fYm8sIHN0cnVjdCBhbWRncHVfdm1fcHQsIGJhc2UpOwo+ICAgfQo+ICAgCj4g
LS8qKgo+ICsvKgoKSHVpPyBUaGF0IGRvZXNuJ3QgbG9vayBjb3JyZWN0IHRvIG1lLCB3aHkgc2hv
dWxkbid0IHRoaXMgYmUgYSAKZG9jdW1lbnRhdGlvbiBjb21tZW50PwoKQ2hyaXN0aWFuLgoKPiAg
ICAqIGFtZGdwdV92bV9wdF9jdXJzb3IgLSBzdGF0ZSBmb3IgZm9yX2VhY2hfYW1kZ3B1X3ZtX3B0
Cj4gICAgKi8KPiAgIHN0cnVjdCBhbWRncHVfdm1fcHRfY3Vyc29yIHsKPiBAQCAtNDgzLDYgKzQ4
Myw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92bV9wdF9uZXh0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAo+ICAgICoKPiAgICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHN0cnVjdHVyZQo+ICAg
ICogQHZtOiBhbWRncHVfdm0gc3RydWN0dXJlCj4gKyAqIEBzdGFydDogb3B0aW9uYWwgY3Vyc29y
IHRvIHN0YXJ0IHdpdGgKPiAgICAqIEBjdXJzb3I6IHN0YXRlIHRvIGluaXRpYWxpemUKPiAgICAq
Cj4gICAgKiBTdGFydHMgYSBkZWVwIGZpcnN0IHRyYXZlcnNhbCBvZiB0aGUgUEQvUFQgdHJlZS4K
PiBAQCAtNTM2LDcgKzUzNyw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92bV9wdF9uZXh0X2Rmcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAkJYW1kZ3B1X3ZtX3B0X2FuY2VzdG9yKGN1
cnNvcik7Cj4gICB9Cj4gICAKPiAtLyoqCj4gKy8qCj4gICAgKiBmb3JfZWFjaF9hbWRncHVfdm1f
cHRfZGZzX3NhZmUgLSBzYWZlIGRlZXAgZmlyc3Qgc2VhcmNoIG9mIGFsbCBQRHMvUFRzCj4gICAg
Ki8KPiAgICNkZWZpbmUgZm9yX2VhY2hfYW1kZ3B1X3ZtX3B0X2Rmc19zYWZlKGFkZXYsIHZtLCBz
dGFydCwgY3Vyc29yLCBlbnRyeSkJCVwKPiBAQCAtODU3LDYgKzg1OCw3IEBAIHN0YXRpYyB2b2lk
IGFtZGdwdV92bV9ib19wYXJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFt
ZGdwdV92bSAqdm0sCj4gICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gICAgKiBA
dm06IFZNIHRvIGFsbG9jYXRlIHBhZ2UgdGFibGVzIGZvcgo+ICAgICogQGN1cnNvcjogV2hpY2gg
cGFnZSB0YWJsZSB0byBhbGxvY2F0ZQo+ICsgKiBAZGlyZWN0OiB1c2UgYSBkaXJlY3QgdXBkYXRl
Cj4gICAgKgo+ICAgICogTWFrZSBzdXJlIGEgc3BlY2lmaWMgcGFnZSB0YWJsZSBvciBkaXJlY3Rv
cnkgaXMgYWxsb2NhdGVkLgo+ICAgICoKPiBAQCAtMTE5NiwxMCArMTE5OCwxMCBAQCB1aW50NjRf
dCBhbWRncHVfdm1fbWFwX2dhcnQoY29uc3QgZG1hX2FkZHJfdCAqcGFnZXNfYWRkciwgdWludDY0
X3QgYWRkcikKPiAgIAlyZXR1cm4gcmVzdWx0Owo+ICAgfQo+ICAgCj4gLS8qCj4gKy8qKgo+ICAg
ICogYW1kZ3B1X3ZtX3VwZGF0ZV9wZGUgLSB1cGRhdGUgYSBzaW5nbGUgbGV2ZWwgaW4gdGhlIGhp
ZXJhcmNoeQo+ICAgICoKPiAtICogQHBhcmFtOiBwYXJhbWV0ZXJzIGZvciB0aGUgdXBkYXRlCj4g
KyAqIEBwYXJhbXM6IHBhcmFtZXRlcnMgZm9yIHRoZSB1cGRhdGUKPiAgICAqIEB2bTogcmVxdWVz
dGVkIHZtCj4gICAgKiBAZW50cnk6IGVudHJ5IHRvIHVwZGF0ZQo+ICAgICoKPiBAQCAtMTIyMyw3
ICsxMjI1LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1fdXBkYXRlX3BkZShzdHJ1Y3QgYW1kZ3B1
X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywKPiAgIAlyZXR1cm4gdm0tPnVwZGF0ZV9mdW5jcy0+
dXBkYXRlKHBhcmFtcywgYm8sIHBkZSwgcHQsIDEsIDAsIGZsYWdzKTsKPiAgIH0KPiAgIAo+IC0v
Kgo+ICsvKioKPiAgICAqIGFtZGdwdV92bV9pbnZhbGlkYXRlX3BkcyAtIG1hcmsgYWxsIFBEcyBh
cyBpbnZhbGlkCj4gICAgKgo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+IEBA
IC0xMjQyLDcgKzEyNDQsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdm1faW52YWxpZGF0ZV9wZHMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCQlhbWRncHVfdm1fYm9fcmVsb2NhdGVk
KCZlbnRyeS0+YmFzZSk7Cj4gICB9Cj4gICAKPiAtLyoKPiArLyoqCj4gICAgKiBhbWRncHVfdm1f
dXBkYXRlX3BkZXMgLSBtYWtlIHN1cmUgdGhhdCBhbGwgZGlyZWN0b3JpZXMgYXJlIHZhbGlkCj4g
ICAgKgo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+IEBAIC0xMjk0LDcgKzEy
OTYsNyBAQCBpbnQgYW1kZ3B1X3ZtX3VwZGF0ZV9wZGVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAo+ICAgCXJldHVybiByOwo+ICAgfQo+ICAgCj4gLS8qKgo+ICsvKgo+ICAgICogYW1kZ3B1
X3ZtX3VwZGF0ZV9mbGFncyAtIGZpZ3VyZSBvdXQgZmxhZ3MgZm9yIFBURSB1cGRhdGVzCj4gICAg
Kgo+ICAgICogTWFrZSBzdXJlIHRvIHNldCB0aGUgcmlnaHQgZmxhZ3MgZm9yIHRoZSBQVEVzIGF0
IHRoZSBkZXNpcmVkIGxldmVsLgo+IEBAIC0yODE1LDYgKzI4MTcsNyBAQCBzdGF0aWMgaW50IGFt
ZGdwdV92bV9jaGVja19jbGVhbl9yZXNlcnZlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
PiAgICAqCj4gICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gICAgKiBAdm06IHJl
cXVlc3RlZCB2bQo+ICsgKiBAcGFzaWQ6IHBhc2lkIHRvIHVzZQo+ICAgICoKPiAgICAqIFRoaXMg
b25seSB3b3JrcyBvbiBHRlggVk1zIHRoYXQgZG9uJ3QgaGF2ZSBhbnkgQk9zIGFkZGVkIGFuZCBu
bwo+ICAgICogcGFnZSB0YWJsZXMgYWxsb2NhdGVkIHlldC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
