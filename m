Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F63FE7C
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 19:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77668908C;
	Tue, 30 Apr 2019 17:07:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DE68908C
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 17:07:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w15so4646253wmc.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 10:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=a9k2ki0NHi22uTlZatggiOFlzKY7fm+q0IxlPbuUDqo=;
 b=jWxT1T07J1Dte7LQsWyPb5SDqcViST7o00LKTCJvJ5Ut50lRxgrKWPONIVs7m3FHPn
 b/a3RE+HJqOCee5cwtvdckQPb8wUG02W1sgq/NT5etAV5u14H5kESY4X1SYHHM0J2HB/
 JlXz8zg7L5jB+Y9F1OccnGJ/3v3XN/fZLISnFLUUl7td/xmHCz0AeLILTfpyYpzXf5jK
 /L8Ar7yGukcNvMkFM19FV7boeFTPI07KHHYw8pJYGXCX2aYFkdSxvQeDgzYJD8XY8jIl
 JGeIw+/XFcqiofNLmp0zExHXwR8vSuMEe/eLSsw7seUkD/CjP5qR2sh/cJOq7Uicq5O4
 wIeQ==
X-Gm-Message-State: APjAAAWDUhLusjveMucoGMAkaxJVN4qqQCQH5lP2zRAxb5V7MaSCcGbL
 2eYjfBXPCVqc6OnasaprqeoacesV
X-Google-Smtp-Source: APXvYqxo3DfkQxfgxTb6jjGZEK8v+eSqyHXK84zJWeViIyNGgF7QbdGGwib7UrbcSzMHUZy10Bb2Rg==
X-Received: by 2002:a1c:f910:: with SMTP id x16mr3826937wmh.114.1556644065814; 
 Tue, 30 Apr 2019 10:07:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e6sm31604615wrc.96.2019.04.30.10.07.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 10:07:44 -0700 (PDT)
Subject: Re: [PATCH V2] drm/amdgpu: Fix VM clean check method
To: Trigger Huang <Trigger.Huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1556635700-29967-1-git-send-email-Trigger.Huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f3de8363-00b7-e665-1908-b1e0e107db88@gmail.com>
Date: Tue, 30 Apr 2019 19:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556635700-29967-1-git-send-email-Trigger.Huang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=a9k2ki0NHi22uTlZatggiOFlzKY7fm+q0IxlPbuUDqo=;
 b=jNOQXJQERZ6zucT30yEqDc2fnB+WT7l1+2KAFpHaoAaNce38T662xhmQaiH2Q9a2tc
 sgTEKdnc92XxgGxG+CSJFGkg7Ta3Oee7iDPgu4C6/bx8JXMmtlLI9PsIlLhKLHGyc7rd
 KiE4As6d8FZVgRt0RUZ7yxaCYnw4lR7I1s7eSNEzRMgFcx8zv3q3bn/KckOm2eaC/zww
 Lppq+mL5DeByRTA0dH9xH/roHEnlIJHCJHd3DiuZYbxzPeDA0yKvfI5yYn/2N1KaC6/l
 WkQkyuV+gjEIWRzZ7gs8Q44NZ11mwKrVFuH1A7lvdwE5/WwB0HJMNNDP53VDBnD90eEU
 mMaQ==
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

QW0gMzAuMDQuMTkgdW0gMTY6NDggc2NocmllYiBUcmlnZ2VyIEh1YW5nOgo+IGFtZGdwdV92bV9t
YWtlX2NvbXB1dGUgaXMgdXNlZCB0byB0dXJuIGEgR0ZYIFZNIGludG8gYSBjb21wdXRlIFZNLAo+
IHRoZSBwcmVyZXF1aXNpdGUgaXMgdGhpcyBWTSBpcyBjbGVhbi4gTGV0J3MgY2hlY2sgaWYgc29t
ZSBwYWdlIHRhYmxlcwo+IGFyZSBhbHJlYWR5IGZpbGxlZCAsIHdoaWxlIG5vdCBjaGVjayBpZiBz
b21lIG1hcHBpbmcgaXMgYWxyZWFkeSBtYWRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVHJpZ2dlciBI
dWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IGluZGV4IDU2ZDgzOGYuLmJk
ZThiY2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IEBAIC0y
NzU1LDYgKzI3NTUsMzcgQEAgaW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPiAgIH0KPiAgIAo+ICAgLyoqCj4gKyAqIGFt
ZGdwdV92bV9jaGVja19jbGVhbl9yZXNlcnZlZCAtIGNoZWNrIGlmIGEgVk0gaXMgY2xlYW4KPiAr
ICoKPiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKiBAdm06IHRoZSBWTSB0
byBjaGVjawo+ICsgKgo+ICsgKiBjaGVjayBhbGwgZW50cmllcyBvZiB0aGUgcm9vdCBQRCwgaWYg
YW55IHN1YnNlcXVlbnQgUERzIGFyZSBhbGxvY2F0ZWQsCj4gKyAqIGl0IG1lYW5zIHRoZXJlIGFy
ZSBwYWdlIHRhYmxlIGNyZWF0aW5nIGFuZCBmaWxsaW5nLCBhbmQgaXMgbm8gYSBjbGVhbgo+ICsg
KiBWTQo+ICsgKgo+ICsgKiBSZXR1cm5zOgo+ICsgKgkwIGlmIHRoaXMgVk0gaXMgY2xlYW4KPiAr
ICovCj4gK3N0YXRpYyBpbnQgYW1kZ3B1X3ZtX2NoZWNrX2NsZWFuX3Jlc2VydmVkKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAo+ICsJc3RydWN0IGFtZGdwdV92bSAqdm0pCj4gK3sKPiArCWVu
dW0gYW1kZ3B1X3ZtX2xldmVsIHJvb3QgPSBhZGV2LT52bV9tYW5hZ2VyLnJvb3RfbGV2ZWw7Cj4g
Kwl1bnNpZ25lZCBpbnQgZW50cmllcyA9IGFtZGdwdV92bV9udW1fZW50cmllcyhhZGV2LCByb290
KTsKPiArCXVuc2lnbmVkIGludCBpID0gMDsKPiArCj4gKwlpZiAoISh2bS0+cm9vdC5lbnRyaWVz
KSkKPiArCQlyZXR1cm4gMDsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKSB7
Cj4gKwkJaWYgKHZtLT5yb290LmVudHJpZXNbaV0uYmFzZS5ibykKPiArCQkJcmV0dXJuIC1FSU5W
QUw7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gKy8qKgo+ICAgICogYW1kZ3B1
X3ZtX21ha2VfY29tcHV0ZSAtIFR1cm4gYSBHRlggVk0gaW50byBhIGNvbXB1dGUgVk0KPiAgICAq
Cj4gICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gQEAgLTI3ODQsNyArMjgxNSw3
IEBAIGludCBhbWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgdW5zCj4gICAJCXJldHVybiByOwo+ICAgCj4gICAJLyog
U2FuaXR5IGNoZWNrcyAqLwo+IC0JaWYgKCFSQl9FTVBUWV9ST09UKCZ2bS0+dmEucmJfcm9vdCkg
fHwgdm0tPnJvb3QuZW50cmllcykgewo+ICsJaWYgKGFtZGdwdV92bV9jaGVja19jbGVhbl9yZXNl
cnZlZChhZGV2LCB2bSkpIHsKCk1heWJlIHVzZSB0aGUgY29tbW9uIGNvZGluZyBpZGlvbSBmb3Ig
dGhpcyBoZXJlOgoKciA9IGFtZGdwdV92bV9jaGVja19jbGVhbi4uCmlmIChyKS4uLi4KCj4gICAJ
CXIgPSAtRUlOVkFMOwoKVGhhdCB3b3VsZCBhbHNvIGF2b2lkIHRoZSBtYW51YWwgYXNzaWdubWVu
dCBoZXJlLgoKV2l0aCB0aGF0IGZpeGVkIHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyAKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uCgpUaGFua3MgZm9yIHRha2lu
ZyBjYXJlIG9mIHRoaXMsCkNocmlzdGlhbi4KCj4gICAJCWdvdG8gdW5yZXNlcnZlX2JvOwo+ICAg
CX0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
