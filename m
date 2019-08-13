Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1268B370
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 11:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2792C6E0B9;
	Tue, 13 Aug 2019 09:11:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374406E0B9
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 09:11:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so794404wmg.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 02:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=FfasmFT/1TBg6kgkzcg7xolji4oMdL8N5+WiSvkFx6I=;
 b=paemmLB7VwgHthCahJHhWZq/pSHY5mTmpMxZ7Y0Tz1q/Ez+EyvY8WGjjTnPt4iNQQO
 T+n67SVv4TkTI9oEW7wXG9kIG9kwnXy7it/sbylGmMfGHZYZAWrD0Sjo2dYxXZqqJzCU
 ZJ+f0s7deCS/gkqRPlGoFYFy7Y0ibalvrU/wCZvNENL7MZQ3o5d6R73XjvyyK2yM5OWI
 rd6/0BLCTgNtkYhtUuhRGKY5lDgcTjzZhuzn6O4ItLpf8QZkP25ZImBtY7jEqTfNx7Yh
 r1j+o2+PC/FhokT5k/tQlhCDqlrWcE2ii+66Rr26A6zHGUXQL2EZ5Y057H8zlVOm/IqZ
 NmMQ==
X-Gm-Message-State: APjAAAVxda2Cxa6KV9UWah5uIQw07gWhYgQwYQOp2MMhi3kbi+t+4nSJ
 UigBjGwhllDBwayIh2RKzTlxm4j3
X-Google-Smtp-Source: APXvYqxhZKMvjdkuXCLLRhp/AmeNGYcwy+CHKyuOdP0qVoHKXzCz7Jr2NTdATtiMtdRbpmsDeeTOOw==
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr1966658wmg.129.1565687491523; 
 Tue, 13 Aug 2019 02:11:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id i93sm13055595wri.57.2019.08.13.02.11.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 02:11:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: fix typo error amdgput -> amdgpu
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>,
 "dl.srdc_lnx_nv10" <dl.srdc_lnx_nv10@amd.com>
References: <20190813090745.9496-1-kevin1.wang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <75d5cb3e-2743-6011-1454-f527a4a9d81b@gmail.com>
Date: Tue, 13 Aug 2019 11:11:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813090745.9496-1-kevin1.wang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FfasmFT/1TBg6kgkzcg7xolji4oMdL8N5+WiSvkFx6I=;
 b=axWpEGoKc14s8tQlbTK4j+tdKzWPrj0oHPTiMLB52GP14XcWohdZnJftB3b00yjga7
 +H1Thc7PboDSbKTtFsLJEsSCDBhkVtN96tmpU3XyCWUw2L3EGeErTuL7oY40/twWQ6t5
 fF1eXYpc1ZLy0+SqHuvqi2iSfOcaw/Z0k8o3MubJz7owh2G5IpePa84DArJ6PB7lho+9
 t0zeHnHq/B5bsM44q2Hrn2ZPmcaUZRD2YX86V1fw7ABUX4Xqo49u2DEh+n5YgvKnZrGg
 +Pmi3MpNMrL8NW3BDpBD0eLx8POiHYQrFsXdJx9T2b/qPZ4t9cwW+WwYoLjtwn2Xsqpv
 I9oA==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTMuMDguMTkgdW0gMTE6MDggc2NocmllYiBXYW5nLCBLZXZpbihZYW5nKToKPiBmaXggdHlw
byBlcnJvcjoKPiBjaGFuZ2UgZnVuY3Rpb24gbmFtZSBmcm9tICJhbWRncHV0X2N0eF90b3RhbF9u
dW1fZW50aXRpZXMiIHRvCj4gImFtZGdwdV9jdHhfdG90YWxfbnVtX2VudGl0aWVzIi4KPgo+IFNp
Z25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+CgpSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyB8IDEyICsrKysrKy0tLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPiBpbmRleCBiN2I0Y2ZhMjU2
ZjEuLjk1ZDgyMDFhNzM4ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3R4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3R4LmMKPiBAQCAtNDMsNyArNDMsNyBAQCBjb25zdCB1bnNpZ25lZCBpbnQgYW1kZ3B1X2N0eF9u
dW1fZW50aXRpZXNbQU1ER1BVX0hXX0lQX05VTV0gPSB7Cj4gICAJW0FNREdQVV9IV19JUF9WQ05f
SlBFR10JPQkxLAo+ICAgfTsKPiAgIAo+IC1zdGF0aWMgaW50IGFtZGdwdXRfY3R4X3RvdGFsX251
bV9lbnRpdGllcyh2b2lkKQo+ICtzdGF0aWMgaW50IGFtZGdwdV9jdHhfdG90YWxfbnVtX2VudGl0
aWVzKHZvaWQpCj4gICB7Cj4gICAJdW5zaWduZWQgaSwgbnVtX2VudGl0aWVzID0gMDsKPiAgIAo+
IEBAIC03NCw3ICs3NCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAo+ICAgCQkJICAgc3RydWN0IGRybV9maWxlICpmaWxwLAo+ICAgCQkJ
ICAgc3RydWN0IGFtZGdwdV9jdHggKmN0eCkKPiAgIHsKPiAtCXVuc2lnbmVkIG51bV9lbnRpdGll
cyA9IGFtZGdwdXRfY3R4X3RvdGFsX251bV9lbnRpdGllcygpOwo+ICsJdW5zaWduZWQgbnVtX2Vu
dGl0aWVzID0gYW1kZ3B1X2N0eF90b3RhbF9udW1fZW50aXRpZXMoKTsKPiAgIAl1bnNpZ25lZCBp
LCBqLCBrOwo+ICAgCWludCByOwo+ICAgCj4gQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50
IGFtZGdwdV9jdHhfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIHN0YXRpYyB2
b2lkIGFtZGdwdV9jdHhfZmluaShzdHJ1Y3Qga3JlZiAqcmVmKQo+ICAgewo+ICAgCXN0cnVjdCBh
bWRncHVfY3R4ICpjdHggPSBjb250YWluZXJfb2YocmVmLCBzdHJ1Y3QgYW1kZ3B1X2N0eCwgcmVm
Y291bnQpOwo+IC0JdW5zaWduZWQgbnVtX2VudGl0aWVzID0gYW1kZ3B1dF9jdHhfdG90YWxfbnVt
X2VudGl0aWVzKCk7Cj4gKwl1bnNpZ25lZCBudW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFs
X251bV9lbnRpdGllcygpOwo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5h
ZGV2Owo+ICAgCXVuc2lnbmVkIGksIGo7Cj4gICAKPiBAQCAtNTI1LDcgKzUyNSw3IEBAIHN0cnVj
dCBkbWFfZmVuY2UgKmFtZGdwdV9jdHhfZ2V0X2ZlbmNlKHN0cnVjdCBhbWRncHVfY3R4ICpjdHgs
Cj4gICB2b2lkIGFtZGdwdV9jdHhfcHJpb3JpdHlfb3ZlcnJpZGUoc3RydWN0IGFtZGdwdV9jdHgg
KmN0eCwKPiAgIAkJCQkgIGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHByaW9yaXR5KQo+ICAgewo+
IC0JdW5zaWduZWQgbnVtX2VudGl0aWVzID0gYW1kZ3B1dF9jdHhfdG90YWxfbnVtX2VudGl0aWVz
KCk7Cj4gKwl1bnNpZ25lZCBudW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251bV9lbnRp
dGllcygpOwo+ICAgCWVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IGN0eF9wcmlvOwo+ICAgCXVuc2ln
bmVkIGk7Cj4gICAKPiBAQCAtNTcwLDcgKzU3MCw3IEBAIHZvaWQgYW1kZ3B1X2N0eF9tZ3JfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2N0eF9tZ3IgKm1ncikKPiAgIAo+ICAgbG9uZyBhbWRncHVfY3R4X21n
cl9lbnRpdHlfZmx1c2goc3RydWN0IGFtZGdwdV9jdHhfbWdyICptZ3IsIGxvbmcgdGltZW91dCkK
PiAgIHsKPiAtCXVuc2lnbmVkIG51bV9lbnRpdGllcyA9IGFtZGdwdXRfY3R4X3RvdGFsX251bV9l
bnRpdGllcygpOwo+ICsJdW5zaWduZWQgbnVtX2VudGl0aWVzID0gYW1kZ3B1X2N0eF90b3RhbF9u
dW1fZW50aXRpZXMoKTsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4Owo+ICAgCXN0cnVjdCBp
ZHIgKmlkcDsKPiAgIAl1aW50MzJfdCBpZCwgaTsKPiBAQCAtNTkyLDcgKzU5Miw3IEBAIGxvbmcg
YW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2ZsdXNoKHN0cnVjdCBhbWRncHVfY3R4X21nciAqbWdyLCBs
b25nIHRpbWVvdXQpCj4gICAKPiAgIHZvaWQgYW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2Zpbmkoc3Ry
dWN0IGFtZGdwdV9jdHhfbWdyICptZ3IpCj4gICB7Cj4gLQl1bnNpZ25lZCBudW1fZW50aXRpZXMg
PSBhbWRncHV0X2N0eF90b3RhbF9udW1fZW50aXRpZXMoKTsKPiArCXVuc2lnbmVkIG51bV9lbnRp
dGllcyA9IGFtZGdwdV9jdHhfdG90YWxfbnVtX2VudGl0aWVzKCk7Cj4gICAJc3RydWN0IGFtZGdw
dV9jdHggKmN0eDsKPiAgIAlzdHJ1Y3QgaWRyICppZHA7Cj4gICAJdWludDMyX3QgaWQsIGk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
