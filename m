Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93258119E5
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299E689496;
	Thu,  2 May 2019 13:16:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6796689496
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:16:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e9so3348270wrc.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 02 May 2019 06:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bDgdpZ6vMQzY8zazmvhS8lLXQYdarqWGBvv4KnX5k5g=;
 b=t+YIDxmbyrbh0QP4gAI1sCTIk2T38p04UOYQx06Seh1fS/eCJyrpy/FBZJQjqaqxJC
 gGpxYU1bWVb+mnFu9N7hkJM4RHbKMD5G/fDpcDpBu2hOl/0+6rNKUoGKCGFfL52GjWPV
 FKhMW1O9II4qzQt1cmEvnVKsjePyfHFTsbpOY8o1N3J1es1u44WmaGaXFhRDFQ/af5Rn
 kuJPDfRtkx9oHSL/em8UMMgTyI4MWRkaav3lijXmY5j1+OraHdUpkcPCMG24tVgcifDs
 YSgpch7lG8+k2Cr3siOsGVgG70OJ60oV0EyUjWsUiBDSojNSaP6cjhOUq6SJqnPxM/5u
 9awA==
X-Gm-Message-State: APjAAAWYEkAPA5d9E68sxvl7AEw7dYjPdoY6pUTxRmbxqRDsztW4E6jD
 D1ZqUyHOFLj6LrWAABJalGdIb+dC
X-Google-Smtp-Source: APXvYqz8nzcPH5H+maoyoe5PIplYjEm/ItSrLUq0hToEC28TfhV7+tsJZ1jHIk4yUZwOAbmijuOmKw==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr2968396wrq.122.1556802966018; 
 Thu, 02 May 2019 06:16:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v1sm43410828wrd.47.2019.05.02.06.16.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 06:16:05 -0700 (PDT)
Subject: Re: [PATCH v2] drm/amd/display: Use long for signed error code checks
 in commit planes
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20190502131427.20202-1-nicholas.kazlauskas@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <00cb38a8-5b30-9fee-776b-83a7b05c487b@gmail.com>
Date: Thu, 2 May 2019 15:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502131427.20202-1-nicholas.kazlauskas@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bDgdpZ6vMQzY8zazmvhS8lLXQYdarqWGBvv4KnX5k5g=;
 b=Lf2AD996VjuZ619aDXSem+MW2fNo8BNhc2scQcRGyKnNiG5r00B1YnsMcOq0Rm7163
 okkqKQ1bGl3hu4XdSKQ/ux/NuqLhGuMT9iTuSGTv683faezGkQs3o0tCA0KrMiMFPJR3
 lBA+JndVnXyAlfiQKL0u2MxC+IrxMb87ezvywF+IGD6UDmaRQZitbN0HhffHSJUTZt3D
 +HTndl3AYHmOykMkEg//Z1W0jj87mzYAneRQEEOV0s5tqPG/AHJaiWaAW5jQBYFJyMPC
 Ydm+/kMhVl7H1GDjhMCoo6WJSW8i/4fDtHOwnhihG5d2oZblnr4c/qmd5dQnKFnW8uy8
 2bSg==
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

QW0gMDIuMDUuMTkgdW0gMTU6MTQgc2NocmllYiBOaWNob2xhcyBLYXpsYXVza2FzOgo+IFtXaHld
Cj4KPiBUaGUgdHlwZSBvZiAncicgaXMgdWludDMyX3QgYW5kIHRoZSByZXR1cm4gY29kZXMgZm9y
IGJvdGg6Cj4KPiAtIHJlc2VydmF0aW9uX29iamVjdF93YWl0X3RpbWVvdXRfcmN1Cj4gLSBhbWRn
cHVfYm9fcmVzZXJ2ZQo+Cj4gLi4uYXJlIHNpZ25lZC4gV2hpbGUgaXQgd29ya3MgZm9yIHRoZSBs
YXR0ZXIgc2luY2UgdGhlIGNoZWNrIGlzCj4gZG9uZSBvbiAhPSAwIGl0IGRvZXNuJ3Qgd29yayBm
b3IgdGhlIGZvcm1lciBzaW5jZSB3ZSBjaGVjayA8PSAwLgo+Cj4gW0hvd10KPgo+IE1ha2UgJ3In
IGEgbG9uZyBpbiBjb21taXQgcGxhbmVzIHNvIHdlJ3JlIG5vdCBkb2luZyBhbnkgdW5zaWduZWQv
c2lnbmVkCj4gY29udmVyc2lvbiBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZS4KPgo+IHYyOiB1c2Ug
bG9uZyBpbnN0ZWFkIG9mIGludCAoQ2hyaXN0aWFuKQo+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2Fy
cGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmljaG9s
YXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+
IGluZGV4IGJlY2Q4Y2IzYWFiNi4uYWMyMmY3MzUxYTQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTUzMzIsNyAr
NTMzMiw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21taXRfcGxhbmVzKHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZSwKPiAgIAkJCQkgICAgc3RydWN0IGRybV9jcnRjICpwY3J0YywK
PiAgIAkJCQkgICAgYm9vbCB3YWl0X2Zvcl92YmxhbmspCj4gICB7Cj4gLQl1aW50MzJfdCBpLCBy
Owo+ICsJdWludDMyX3QgaTsKPiAgIAl1aW50NjRfdCB0aW1lc3RhbXBfbnM7Cj4gICAJc3RydWN0
IGRybV9wbGFuZSAqcGxhbmU7Cj4gICAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5l
X3N0YXRlLCAqbmV3X3BsYW5lX3N0YXRlOwo+IEBAIC01MzQzLDYgKzUzNDMsNyBAQCBzdGF0aWMg
dm9pZCBhbWRncHVfZG1fY29tbWl0X3BsYW5lcyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3Rh
dGUsCj4gICAJc3RydWN0IGRtX2NydGNfc3RhdGUgKmRtX29sZF9jcnRjX3N0YXRlID0KPiAgIAkJ
CXRvX2RtX2NydGNfc3RhdGUoZHJtX2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUoc3RhdGUsIHBj
cnRjKSk7Cj4gICAJaW50IHBsYW5lc19jb3VudCA9IDAsIHZwb3MsIGhwb3M7Cj4gKwlsb25nIHI7
Cj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2JvICphYm87Cj4g
ICAJdWludDY0X3QgdGlsaW5nX2ZsYWdzOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
