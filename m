Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441CFFB81
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 16:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FA3891F2;
	Tue, 30 Apr 2019 14:29:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E59F891F4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 14:29:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so12774335wrs.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 07:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GjV3W37dOB2+Xp66ey5ko2tUcqP4Lu4N1oo9dbGfE3s=;
 b=Cspw4A0RJDOfEuV7xLlg66Inheejwz6fTQWDpQ+d5jKguketlEf7crac3mbfmFI96K
 c6iz8KvZXUI+XOtTjr+qw61OqkbZB+jMLCqG+EAqCx1zIaVSpWqdeNkFo519GyS/HMPg
 adZT0uEHphKvCl7LUXBkMZKwfWvpUtM3DQof2XAUEtAEw0J7GfTlZDkjYUXCO3l9Dm0E
 m6Ea34ImV0UjUsyMC8HbuuKcBmeWwCH4J8RYog1pRtEjEFBt1ddSLzY4hzKRSHKUv+FU
 ipPYVLhB1Aro5lLsAkZy/AYThtcHvx208Xqo0GjiK9QlIVQsqYZb5AKIXtAq/dHhn1jQ
 r9lQ==
X-Gm-Message-State: APjAAAVIlrbDj2bZgV601d4GXANu6SJFfntsXumXw8gbs2XDJ1R+OL03
 eqr/fVKsggkVGr5SRsqa9RV1qEZe
X-Google-Smtp-Source: APXvYqw9abTXVaOdJusmgQMm6IgfW4WYvOHSLehUPIZhuB9nP6ihTw1ZVG5XsF8cmrcTKmG3L6D96A==
X-Received: by 2002:adf:e486:: with SMTP id i6mr7228416wrm.42.1556634568057;
 Tue, 30 Apr 2019 07:29:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k67sm3132971wmb.34.2019.04.30.07.29.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 07:29:27 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix VM clean check method
To: Trigger Huang <Trigger.Huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1556633912-27698-1-git-send-email-Trigger.Huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aae9772a-9d74-18c4-1ff0-fe9f3b6a60f3@gmail.com>
Date: Tue, 30 Apr 2019 16:29:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556633912-27698-1-git-send-email-Trigger.Huang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GjV3W37dOB2+Xp66ey5ko2tUcqP4Lu4N1oo9dbGfE3s=;
 b=BesAFtMnp6I78ufjusy+SdlGtKxRSfJLXdFgVzo1qNY+eqUDERYmKqwVhA6bcb68k6
 EZR/gzrgXfXDudaTQxcLHuK81i0GVPHlzMgif8gAxJO0+xE7X8+b1r2T61a8S61/Ub41
 sfZ4FhELIknRtvLVvWeDl74Fo6u52LmjlfHEShtpJDFECvpknxCTz2c72+ePA43j8eRQ
 aPNaX7M/mhNSQekC2DD89Fy94qAC6vUmLa2Rk9mYi3YPA57LXrnpt8urBjX/NxPZVp4r
 CRSY9uFtc6GVcBtzBoW5U2ngjfzfWb+0ZlZynLhp495csSW/HLPPQJmgb6wrncIfTOKR
 Tr3Q==
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

QW0gMzAuMDQuMTkgdW0gMTY6MTggc2NocmllYiBUcmlnZ2VyIEh1YW5nOgo+IGFtZGdwdV92bV9t
YWtlX2NvbXB1dGUgaXMgdXNlZCB0byB0dXJuIGEgR0ZYIFZNIGludG8gYSBjb21wdXRlIFZNLAo+
IHRoZSBwcmVyZXF1aXNpdGUgaXMgdGhpcyBWTSBpcyBjbGVhbi4gTGV0J3MgY2hlY2sgaWYgc29t
ZSBwYWdlIHRhYmxlcwo+IGFyZSBhbHJlYWR5IGZpbGxlZCAsIHdoaWxlIG5vdCBjaGVjayBpZiBz
b21lIG1hcHBpbmcgaXMgYWxyZWFkeSBtYWRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVHJpZ2dlciBI
dWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCj4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBpbmRleCA1NmQ4MzhmLi42
NzUyZDRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBAQCAt
Mjc1NSw2ICsyNzU1LDQwIEBAIGludCBhbWRncHVfdm1faW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCj4gICB9Cj4gICAKPiAgIC8qKgo+ICsgKiBh
bWRncHVfdm1fY2hlY2tfY2xlYW5fcmVzZXJ2ZWQgLSBjaGVjayBpZiBhIFZNIGlzIGNsZWFuCj4g
KyAqCj4gKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiArICogQHZtOiB0aGUgVk0g
dG8gY2hlY2sKPiArICoKPiArICogY2hlY2sgYWxsIGVudHJpZXMgb2YgdGhlIHJvb3QgUEQsIGlm
IGFueSBzdWJzZXF1ZW50IFBEcyBhcmUgYWxsb2NhdGVkLAo+ICsgKiBpdCBtZWFucyB0aGVyZSBh
cmUgcGFnZSB0YWJsZSBjcmVhdGluZyBhbmQgZmlsbGluZywgYW5kIGlzIG5vIGEgY2xlYW4KPiAr
ICogVk0KPiArICoKPiArICogUmV0dXJuczoKPiArICoJMCBpZiB0aGlzIFZNIGlzIGNsZWFuCj4g
KyAqLwo+ICtzdGF0aWMgaW50IGFtZGdwdV92bV9jaGVja19jbGVhbl9yZXNlcnZlZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPiArCXN0cnVjdCBhbWRncHVfdm0gKnZtKQo+ICt7Cj4gKwlp
bnQgcmV0ID0gMDsKPiArCj4gKwlpZiAodm0tPnJvb3QuZW50cmllcykgewoKVXNlIGFuIGVhcmx5
IHJldHVybiBoZXJlLgoKPiArCQl1bnNpZ25lZCBpbnQgaSA9IDA7Cj4gKwkJZW51bSBhbWRncHVf
dm1fbGV2ZWwgbCA9IGFkZXYtPnZtX21hbmFnZXIucm9vdF9sZXZlbDsKPiArCQl1bnNpZ25lZCBp
bnQgZW50cmllcyA9IGFtZGdwdV92bV9udW1fZW50cmllcyhhZGV2LCBsKTsKCkFuZCBjb2Rpbmcg
c3R5bGUgdXN1YWxseSB1c2VzIHJldmVyc2UgeC1tYXMgdHJlZSwgZS5nLiBzdHVmZiBsaWtlICJp
IiBvciAKInJldCIgbGFzdC4KCkNocmlzdGlhbi4KCj4gKwo+ICsJCWZvciAoaSA9IDA7IGkgPCBl
bnRyaWVzOyBpKyspIHsKPiArCQkJaWYgKHZtLT5yb290LmVudHJpZXNbaV0uYmFzZS5ibykgewo+
ICsJCQkJcmV0ID0gLUVJTlZBTDsKPiArCQkJCWJyZWFrOwo+ICsJCQl9Cj4gKwkJfQo+ICsJfQo+
ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gKy8qKgo+ICAgICogYW1kZ3B1X3ZtX21ha2Vf
Y29tcHV0ZSAtIFR1cm4gYSBHRlggVk0gaW50byBhIGNvbXB1dGUgVk0KPiAgICAqCj4gICAgKiBA
YWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gQEAgLTI3ODQsNyArMjgxOCw3IEBAIGludCBh
bWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qg
YW1kZ3B1X3ZtICp2bSwgdW5zCj4gICAJCXJldHVybiByOwo+ICAgCj4gICAJLyogU2FuaXR5IGNo
ZWNrcyAqLwo+IC0JaWYgKCFSQl9FTVBUWV9ST09UKCZ2bS0+dmEucmJfcm9vdCkgfHwgdm0tPnJv
b3QuZW50cmllcykgewo+ICsJaWYgKGFtZGdwdV92bV9jaGVja19jbGVhbl9yZXNlcnZlZChhZGV2
LCB2bSkpIHsKPiAgIAkJciA9IC1FSU5WQUw7Cj4gICAJCWdvdG8gdW5yZXNlcnZlX2JvOwo+ICAg
CX0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
