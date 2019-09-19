Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E051B7F64
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 18:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E736F52D;
	Thu, 19 Sep 2019 16:51:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D774D6F43D
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 16:51:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n14so3820907wrw.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 09:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MnOdh5CM9bjQMvo9aEVRf4Y9ttVF2L4DlId6/0clnkU=;
 b=tF0Q3yaRalMhAP708i7dMLsWFni9/pycjpkWquUhS1dLTs2TVJ8Gt3mSg4kwoi49kt
 uJggyDoSQXkBfgKimwLAyyy/UVZBNZPyK6yAWKr7fL26bKKtQkqkVW5NzUUhdW71VvEx
 y7q2VEl6dK1X/t8AcVdaX8UkhaV3eZgoSLApS4Fq3VUwpudmZ4DTQ2uo4URZf+IpS39O
 i8eAqxhMdWr2iz7kA0ZFB3ZI7ucqZQTtyJZokv5obWOVXsBqA29jNX/3i1HbKnZ7zBQ9
 RXcUvVvj/g4TnFZu6e8SLGf940+nm2kA2eMxjgZGw4yLLuAs3PxzCq8v2xC4XwChQVUL
 bLmw==
X-Gm-Message-State: APjAAAV0TmggNjtIekGsgwQ5r75F1Oh44A9hVPsGp6MHvt5/ZY+2dBh3
 qxjh3+P8YiCmaSHQugbmFbyGu1SA
X-Google-Smtp-Source: APXvYqxRjbhNsZcgFc1x4B4Z52WMGf26CdvDhLJ8eTbuDw3tPC2s2MpH7+Z82I1Ar5Tr3MYeTMIDyQ==
X-Received: by 2002:adf:f401:: with SMTP id g1mr7430727wro.275.1568911874282; 
 Thu, 19 Sep 2019 09:51:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d78sm8827701wmd.47.2019.09.19.09.51.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 09:51:13 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix potential VM faults
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190919084136.82658-1-christian.koenig@amd.com>
 <fd47f3c6-a336-5a02-6ff2-3c24ad81dcb9@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2f65f219-79b8-8bd0-6acb-1477d921c7eb@gmail.com>
Date: Thu, 19 Sep 2019 18:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fd47f3c6-a336-5a02-6ff2-3c24ad81dcb9@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MnOdh5CM9bjQMvo9aEVRf4Y9ttVF2L4DlId6/0clnkU=;
 b=gVpMzMhJDO5zB4BlkMHrfVo3rz96eMdt0jkYsjJcsBvs1Ui1Na0Fy4H3VX2S45XYtw
 KmIhaktNkDjpl0ep5aD6nVRwlTFINfnowzlYBM6lI+WD+KnGtuVbLvL820qkSjMh+2mi
 6VOvJrU/9iQcT8nUWIIm2daogCVU0qOrhH6N9UM27gq8HIASxX0XmJWP0kwHLE6haisb
 BrqCGWnUD9u1SrS+gGNsYzrXjPFPvpfVh44GRCudwSGADr1v9f4eJvZkc9YweIZsl25A
 BhhP2OGEiIEdUCMJUHnN6cqEhekbX6eR79ynJjchcWp961DG5Lkx3Z3/YtBK3j+fUC16
 grZQ==
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

PiBJZiB0aGUgcGFnZSB0YWJsZXMgYXJlIHJlc2VydmVkIG9yIGZlbmNlZCB3aGlsZSB5b3UgYWxs
b2NhdGUgYSBuZXcgb25lLCB0aGV5IHdvdWxkIG5vdCBiZSBldmljdGVkLgpBbmQgZXhhY3RseSB0
aGF0J3Mgbm90IGNvcnJlY3QuIFRoZSBUVE1fT1BUX0ZMQUdfQUxMT1dfUkVTX0VWSUNUIGZsYWcg
CmFsbG93cyBldmljdGluZyBvZiByZXNlcnZlZCBvYmplY3RzLgoKVGhpcyBpcyB1c2VmdWwgZm9y
IGFsbG9jYXRpbmcgcGVyIFZNIEJPcywgYnV0IGlzIG9mIGNvdXJzZSBjb21wbGV0ZWx5IApmYXRh
bCBpbiBhbGwgb3RoZXIgY2FzZXMuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpBbSAxOS4wOS4xOSB1
bSAxNjoyOSBzY2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoKPiBJJ20gbm90IGRpc2FncmVlaW5nIHdp
dGggdGhlIGNoYW5nZS4gSnVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgdGhpcwo+IGNvdWxk
IGhhdmUgY2F1c2VkIGEgVk0gZmF1bHQuIElmIHRoZSBwYWdlIHRhYmxlcyBhcmUgcmVzZXJ2ZWQg
b3IgZmVuY2VkCj4gd2hpbGUgeW91IGFsbG9jYXRlIGEgbmV3IG9uZSwgdGhleSB3b3VsZCBub3Qg
YmUgZXZpY3RlZC4gSWYgdGhleSBhcmUgbm90Cj4gcmVzZXJ2ZWQgb3IgZmVuY2VkLCB0aGVyZSBz
aG91bGQgYmUgbm8gZXhwZWN0YXRpb24gdGhhdCB0aGV5IHN0YXkgcmVzaWRlbnQuCj4KPiBJcyB0
aGlzIHJlbGF0ZWQgdG8gcmVjb3ZlcmFibGUgcGFnZSBmYXVsdCBoYW5kbGluZz8gRG8gd2UgbmVl
ZCBzb21lIG1vcmUKPiBnZW5lcmljIHdheSB0byBoYW5kbGUgZXZpY3Rpb24gb2YgcGFnZSB0YWJs
ZXMgYW5kIHVwZGF0ZSB0aGUgcGFyZW50IHBhZ2UKPiBkaXJlY3RvcnkgKGludmFsaWRhdGUgdGhl
IGNvcnJlc3BvbmRpbmcgUERFKT8KPgo+IFJlZ2FyZHMsCj4gICDCoCBGZWxpeAo+Cj4gT24gMjAx
OS0wOS0xOSA0OjQxLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBXaGVuIHdlIGFsbG9jYXRl
IG5ldyBwYWdlIHRhYmxlcyB1bmRlciBtZW1vcnkKPj4gcHJlc3N1cmUgd2Ugc2hvdWxkIG5vdCBl
dmljdCBvbGQgb25lcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiAtLS0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5jIHwgMyArKy0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jCj4+IGluZGV4IDcwZDQ1ZDQ4OTA3YS4uOGU0NGVjYWFkYTM1IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+IEBA
IC01MTQsNyArNTE0LDggQEAgc3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAo+PiAgICAJCS5pbnRlcnJ1cHRpYmxlID0gKGJwLT50eXBlICE9
IHR0bV9ib190eXBlX2tlcm5lbCksCj4+ICAgIAkJLm5vX3dhaXRfZ3B1ID0gYnAtPm5vX3dhaXRf
Z3B1LAo+PiAgICAJCS5yZXN2ID0gYnAtPnJlc3YsCj4+IC0JCS5mbGFncyA9IFRUTV9PUFRfRkxB
R19BTExPV19SRVNfRVZJQ1QKPj4gKwkJLmZsYWdzID0gYnAtPnR5cGUgIT0gdHRtX2JvX3R5cGVf
a2VybmVsID8KPj4gKwkJCVRUTV9PUFRfRkxBR19BTExPV19SRVNfRVZJQ1QgOiAwCj4+ICAgIAl9
Owo+PiAgICAJc3RydWN0IGFtZGdwdV9ibyAqYm87Cj4+ICAgIAl1bnNpZ25lZCBsb25nIHBhZ2Vf
YWxpZ24sIHNpemUgPSBicC0+c2l6ZTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
