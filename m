Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817D9BD39
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Aug 2019 13:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9DD6E0BA;
	Sat, 24 Aug 2019 11:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0426E0BA
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 11:10:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z11so10878033wrt.4
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 04:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=AO4MPDm14M0LcFjasKA3xgQT94k2wEk6B9yDRfCYpAU=;
 b=Rj2QKKE5rl1gH8iBpH2VYRh8m7oEqHU6rRrYm8K1q6UomesQLF3CYT2PKjDbAlgAmg
 txScSJJfAR7a2e+2R8nIBY/Yl1RQwQ/pkfwClMUkItqyGkvZgeDCMtbcTJIfhjiwViFN
 jWM4sdhdS30Ohum8MX+3s5Lp289m94ccnK98Vhtl6E82O/94CoJ2mdD7UKRJwHLfOOZL
 z9Ex3qaKsOt5UiW982hNgmgk+WsLzJOh6NQ6xUU0e816eRRciIYa25yL+0p8Yllu/1Zs
 d8pq/Dd5mnoGdvJQlLlH/0DP7xc9z98K9Ubog/Rhcp1+jFlAncfN1cWKqSIlABt8j3i2
 pGjA==
X-Gm-Message-State: APjAAAXd67J5HvbMP5zSprWzJD4cRiDO6sNuy9WPJeFgAF8U8UV1Zi28
 K4nL6ulXqNQDABRTVlvYIFCEZ2fQ
X-Google-Smtp-Source: APXvYqwfmt9ZFv7bvDylrQBUOdCbORBuyeaEO4guaW05sSsj0cK59V/NGuLoupi6zj+dVflyQliuqg==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr10476780wrn.197.1566645005936; 
 Sat, 24 Aug 2019 04:10:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w14sm5021142wrl.21.2019.08.24.04.10.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Aug 2019 04:10:05 -0700 (PDT)
Subject: Re: [PATCH] Revert "drm/amdgpu: free up the first paging queue v2"
To: Gang Ba <gaba@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1566590496-27967-1-git-send-email-gaba@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cc47da8a-ce82-3f17-dcf9-aa11484f53a2@gmail.com>
Date: Sat, 24 Aug 2019 13:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566590496-27967-1-git-send-email-gaba@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AO4MPDm14M0LcFjasKA3xgQT94k2wEk6B9yDRfCYpAU=;
 b=Id+mnZvwWaCbu3hE8ij41QzIbkeJLxtUsHwAA4X8cv4rhUPGuTbZW0/us5jOTTsMzL
 AMqNMYLdB2mVcM8zmhUr+zgcTXlyqZDueeR+OxxpH9Xoc4WZ81DUaKxt/DwEWC93UKZZ
 5x7JpJYTk/qoVPvKLLS6FcX21QbNWrmM141+cnhMJYouH48k4JOWjxDhWe30KAR44pWj
 vpO3Whi9Li2nxsUr4DuKhysfOZNoo0DUNJpRDPmSJ9DxtMXGrWYyISK7UHzu5tFjMNAx
 2gKi/i736uKhr1GRcStc1Q77kt+Pb4bZpep5kkygKMqlsgzyITt6gQgMU9uXkGWKwyaE
 Jb1Q==
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjMuMDguMTkgdW0gMjI6MDEgc2NocmllYiBHYW5nIEJhOgo+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgNGY4YmM3MmZiZjEwZjJkYzhiY2E3NGQ1ZGEwOGIzYTk4MWIyZTVjZC4KPgo+IENoYW5nZS1J
ZDogSTU3N2JhMjM2ZTA1NzFkMTE0MDBhNTFmOWQ5NTg0MDIzNGFlZjY3OGEKCk1pc3NpbmcgU2ln
bmVkLW9mLWJ5IGxpbmUgaGVyZS4gV2l0aCB0aGF0IGZpeGVkIFJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gCkvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMjMgKysrKysrKystLS0tLS0tLS0tLS0t
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiBpbmRleCBiM2IyYzIxLi43
NzUwYjM3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRf
MC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiBAQCAt
MjUwMCw4ICsyNTAwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfYnVmZmVyX2Z1bmNz
IHNkbWFfdjRfMF9idWZmZXJfZnVuY3MgPSB7Cj4gICBzdGF0aWMgdm9pZCBzZG1hX3Y0XzBfc2V0
X2J1ZmZlcl9mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsKPiAgIAlhZGV2
LT5tbWFuLmJ1ZmZlcl9mdW5jcyA9ICZzZG1hX3Y0XzBfYnVmZmVyX2Z1bmNzOwo+IC0JaWYgKGFk
ZXYtPnNkbWEuaGFzX3BhZ2VfcXVldWUgJiYgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzID4gMSkK
PiAtCQlhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19yaW5nID0gJmFkZXYtPnNkbWEuaW5zdGFuY2Vb
MV0ucGFnZTsKPiArCWlmIChhZGV2LT5zZG1hLmhhc19wYWdlX3F1ZXVlKQo+ICsJCWFkZXYtPm1t
YW4uYnVmZmVyX2Z1bmNzX3JpbmcgPSAmYWRldi0+c2RtYS5pbnN0YW5jZVswXS5wYWdlOwo+ICAg
CWVsc2UKPiAgIAkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfcmluZyA9ICZhZGV2LT5zZG1hLmlu
c3RhbmNlWzBdLnJpbmc7Cj4gICB9Cj4gQEAgLTI1MjAsMjIgKzI1MjAsMTUgQEAgc3RhdGljIHZv
aWQgc2RtYV92NF8wX3NldF92bV9wdGVfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cj4gICAJdW5zaWduZWQgaTsKPiAgIAo+ICAgCWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX2Z1bmNz
ID0gJnNkbWFfdjRfMF92bV9wdGVfZnVuY3M7Cj4gLQlpZiAoYWRldi0+c2RtYS5oYXNfcGFnZV9x
dWV1ZSAmJiBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXMgPiAxKSB7Cj4gLQkJZm9yIChpID0gMTsg
aSA8IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsgaSsrKSB7Cj4gKwlmb3IgKGkgPSAwOyBpIDwg
YWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsKPiArCQlpZiAoYWRldi0+c2RtYS5oYXNf
cGFnZV9xdWV1ZSkKPiAgIAkJCXNjaGVkID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbaV0ucGFnZS5z
Y2hlZDsKPiAtCQkJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfcnFzW2kgLSAxXSA9Cj4gLQkJCQkm
c2NoZWQtPnNjaGVkX3JxW0RSTV9TQ0hFRF9QUklPUklUWV9LRVJORUxdOwo+IC0JCX0KPiAtCQlh
ZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzID0gYWRldi0+c2RtYS5udW1faW5zdGFuY2Vz
IC0gMTsKPiAtCQlhZGV2LT52bV9tYW5hZ2VyLnBhZ2VfZmF1bHQgPSAmYWRldi0+c2RtYS5pbnN0
YW5jZVswXS5wYWdlOwo+IC0JfSBlbHNlIHsKPiAtCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2Rt
YS5udW1faW5zdGFuY2VzOyBpKyspIHsKPiArCQllbHNlCj4gICAJCQlzY2hlZCA9ICZhZGV2LT5z
ZG1hLmluc3RhbmNlW2ldLnJpbmcuc2NoZWQ7Cj4gLQkJCWFkZXYtPnZtX21hbmFnZXIudm1fcHRl
X3Jxc1tpXSA9Cj4gLQkJCQkmc2NoZWQtPnNjaGVkX3JxW0RSTV9TQ0hFRF9QUklPUklUWV9LRVJO
RUxdOwo+IC0JCX0KPiAtCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzID0gYWRldi0+
c2RtYS5udW1faW5zdGFuY2VzOwo+ICsJCWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX3Jxc1tpXSA9
Cj4gKwkJCSZzY2hlZC0+c2NoZWRfcnFbRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTF07Cj4gICAJ
fQo+ICsJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfbnVtX3JxcyA9IGFkZXYtPnNkbWEubnVtX2lu
c3RhbmNlczsKPiAgIH0KPiAgIAo+ICAgY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9ja192ZXJz
aW9uIHNkbWFfdjRfMF9pcF9ibG9jayA9IHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
