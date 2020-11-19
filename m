Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8577C2B8CC8
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Nov 2020 09:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB99F897F6;
	Thu, 19 Nov 2020 08:04:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97D8897F6;
 Thu, 19 Nov 2020 08:04:29 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e18so4865212edy.6;
 Thu, 19 Nov 2020 00:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WyWbYDEJWAIUHmHGkFfA0PJqm8v8gLeuNb1569ZLXEQ=;
 b=Gn7TzW5FFvQpwnjNXRNYmXFH6aaH989HgvPQbQYeTfYu32Qfy0Y6WLMDjN3X0MtRqB
 w2Ai6Sti3bv2xOsHkXePtujj+o/4B5drp/nZ2OyAtnVRFLC5JqqjrpIz6+Bmspxv2sII
 btsnbd1TDwa3EhSEGVnuFR8A3QyvXUp02mmTQCcUlbaAm0CPba4b+QqMclG7TV3TKxzf
 aCI8mqNoZ7Hknw0gWRUe1UhMZI/p9t3YzndhFAX1NXwG4JL65FBuUZs7cL6H76WW2taG
 a9icjqK2Z2oPDjiDlmLpQmgzAU/V7HVza1HEcN8HxsU5dJeFw8Rnts3l455CazuH+xDY
 3eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=WyWbYDEJWAIUHmHGkFfA0PJqm8v8gLeuNb1569ZLXEQ=;
 b=h1B6NmXQF5fCseUKI1nlT4LluoqYuWcE4qwboc34IsxVW3+KOfr/VRW774hS1ObQ8X
 zmuMHngDdqAkGImQuBVlKTs4df2QZXiN6GoE8lxzI2ab9t79CMKnLyJvaMcRN7mkD2mf
 CViDFW4In2DuPARBspSvTZ4/S3IhGSUHyVexb482NqB119xfXVr6oPwyUZWdfXi1S7m1
 6yY3VVG4jWNcnNqDjiEnIUY9mUASm5iExJJvQbpOkQLfyaB4DPgrB0ZrHzrlLF+5TpfH
 E6K6hyYsLEgCBhhnzYVYipvmAh7heLV8ftAoNdH2usZP70wwmo1c2XsJgQnjS2B37myt
 UR0Q==
X-Gm-Message-State: AOAM531dG41z/4FkbGNqs+nHecRnXEMIzd2qyKRMkB710zNFA47Y35A/
 VFEm8HsLL3/B/Y5smfmAmyEMXWKTubI=
X-Google-Smtp-Source: ABdhPJx5r8i6cQl9AuYE4e48SEsqL67ChHcX8fNjrcilRHKGhCk12hJiHvDLoorT1b6x9eBc8XkDVQ==
X-Received: by 2002:aa7:ce82:: with SMTP id y2mr30027485edv.6.1605772535707;
 Wed, 18 Nov 2020 23:55:35 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b9sm12495446ejb.0.2020.11.18.23.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 23:55:35 -0800 (PST)
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, christian.koenig@amd.com,
 Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
 <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
 <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
 <d0a3ee49-64f3-a223-7e84-0c8eb3481f61@gmail.com>
 <e462f296-75d0-316a-e30f-c985e7aac88d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f65c5d45-8cb2-fde1-1785-756088aa95d5@gmail.com>
Date: Thu, 19 Nov 2020 08:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e462f296-75d0-316a-e30f-c985e7aac88d@amd.com>
Content-Language: en-US
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTguMTEuMjAgdW0gMTc6MjAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEx
LzE4LzIwIDc6MDEgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDE4LjExLjIwIHVt
IDA4OjM5IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIFR1ZSwgTm92IDE3LCAyMDIwIGF0
IDk6MDcgUE0gQW5kcmV5IEdyb2R6b3Zza3kKPj4+IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29t
PiB3cm90ZToKPj4+Pgo+Pj4+IE9uIDExLzE3LzIwIDI6NDkgUE0sIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4+Pj4+IE9uIFR1ZSwgTm92IDE3LCAyMDIwIGF0IDAyOjE4OjQ5UE0gLTA1MDAsIEFuZHJl
eSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4gT24gMTEvMTcvMjAgMTo1MiBQTSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPj4+Pj4+PiBPbiBUdWUsIE5vdiAxNywgMjAyMCBhdCAwMTozODoxNFBNIC0w
NTAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+Pj4+Pj4gT24gNi8yMi8yMCA1OjUzIEFN
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gU3VuLCBKdW4gMjEsIDIwMjAgYXQg
MDI6MDM6MDhBTSAtMDQwMCwgQW5kcmV5IEdyb2R6b3Zza3kgCj4+Pj4+Pj4+PiB3cm90ZToKPj4+
Pj4+Pj4+PiBObyBwb2ludCB0byB0cnkgcmVjb3ZlcnkgaWYgZGV2aWNlIGlzIGdvbmUsIGp1c3Qg
bWVzc2VzIHVwIAo+Pj4+Pj4+Pj4+IHRoaW5ncy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+
Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+IMKgwqDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYyB8IDE2IAo+Pj4+Pj4+Pj4+ICsrKysrKysrKysrKysrKysKPj4+Pj4+
Pj4+PiDCoMKgwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgfCA4
ICsrKysrKysrCj4+Pj4+Pj4+Pj4gwqDCoMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRp
b25zKCspCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIAo+Pj4+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4+Pj4+Pj4gaW5kZXggNjkzMmQ3NS4uNWQ2ZDNkOSAx
MDA2NDQKPj4+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMKPj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMKPj4+Pj4+Pj4+PiBAQCAtMTEyOSwxMiArMTEyOSwyOCBAQCBzdGF0aWMgaW50IGFtZGdw
dV9wY2lfcHJvYmUoc3RydWN0IAo+Pj4+Pj4+Pj4+IHBjaV9kZXYgKnBkZXYsCj4+Pj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pj4+Pj4gwqDCoMKgwqAgfQo+Pj4+
Pj4+Pj4+ICtzdGF0aWMgdm9pZCBhbWRncHVfY2FuY2VsX2FsbF90ZHIoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCj4+Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaW50
IGk7Cj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBp
IDwgQU1ER1BVX01BWF9SSU5HUzsgKytpKSB7Cj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsK
Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIXJpbmcgfHwgIXJpbmctPnNjaGVkLnRocmVhZCkKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4+Pj4+PiAr
Cj4+Pj4+Pj4+Pj4gKyBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJnJpbmctPnNjaGVkLndvcmtf
dGRyKTsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+Pj4+ICt9Cj4+Pj4+Pj4+
PiBJIHRoaW5rIHRoaXMgaXMgYSBmdW5jdGlvbiB0aGF0J3Mgc3VwcG9zZWQgdG8gYmUgaW4gCj4+
Pj4+Pj4+PiBkcm0vc2NoZWR1bGVyLCBub3QKPj4+Pj4+Pj4+IGhlcmUuIE1pZ2h0IGFsc28ganVz
dCBiZSB5b3VyIGNsZWFudXAgY29kZSBiZWluZyBvcmRlcmVkIAo+Pj4+Pj4+Pj4gd3JvbmdseSwg
b3IgeW91cgo+Pj4+Pj4+Pj4gc3BsaXQgaW4gb25lIG9mIHRoZSBlYXJsaWVyIHBhdGNoZXMgbm90
IGRvbmUgcXVpdGUgcmlnaHQuCj4+Pj4+Pj4+PiAtRGFuaWVsCj4+Pj4+Pj4+IFRoaXMgZnVuY3Rp
b24gaXRlcmF0ZXMgYWNyb3NzIGFsbCB0aGUgc2NoZWR1bGVycyBwZXIgYW1kZ3B1IAo+Pj4+Pj4+
PiBkZXZpY2UgYW5kIGFjY2Vzc2VzCj4+Pj4+Pj4+IGFtZGdwdSBzcGVjaWZpYyBzdHJ1Y3R1cmVz
ICwgZHJtL3NjaGVkdWxlciBkZWFscyB3aXRoIHNpbmdsZSAKPj4+Pj4+Pj4gc2NoZWR1bGVyIGF0
IG1vc3QKPj4+Pj4+Pj4gc28gbG9va3MgdG8gbWUgbGlrZSB0aGlzIGlzIHRoZSByaWdodCBwbGFj
ZSBmb3IgdGhpcyBmdW5jdGlvbgo+Pj4+Pj4+IEkgZ3Vlc3Mgd2UgY291bGQga2VlcCB0cmFjayBv
ZiBhbGwgc2NoZWR1bGVycyBzb21ld2hlcmUgaW4gYSAKPj4+Pj4+PiBsaXN0IGluCj4+Pj4+Pj4g
c3RydWN0IGRybV9kZXZpY2UgYW5kIHdyYXAgdGhpcyB1cC4gVGhhdCB3YXMga2luZGEgdGhlIGlk
ZWEuCj4+Pj4+Pj4KPj4+Pj4+PiBNaW5pbWFsbHkgSSB0aGluayBhIHRpbnkgd3JhcHBlciB3aXRo
IGRvY3MgZm9yIHRoZQo+Pj4+Pj4+IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndv
cmtfdGRyKTsgd2hpY2ggZXhwbGFpbnMgd2hhdCAKPj4+Pj4+PiB5b3UgbXVzdAo+Pj4+Pj4+IG9i
c2VydmUgdG8gbWFrZSBzdXJlIHRoZXJlJ3Mgbm8gcmFjZS4KPj4+Pj4+IFdpbGwgZG8KPj4+Pj4+
Cj4+Pj4+Pgo+Pj4+Pj4+IEknbSBub3QgZXhhY3RseSBzdXJlIHRoZXJlJ3Mgbm8KPj4+Pj4+PiBn
dWFyYW50ZWUgaGVyZSB3ZSB3b24ndCBnZXQgYSBuZXcgdGRyIHdvcmsgbGF1bmNoZWQgcmlnaHQg
Cj4+Pj4+Pj4gYWZ0ZXJ3YXJkcyBhdAo+Pj4+Pj4+IGxlYXN0LCBzbyB0aGlzIGxvb2tzIGEgYml0
IGxpa2UgYSBoYWNrLgo+Pj4+Pj4gTm90ZSB0aGF0IGZvciBhbnkgVERSIHdvcmsgaGFwcGVuaW5n
IHBvc3QgYW1kZ3B1X2NhbmNlbF9hbGxfdGRyCj4+Pj4+PiBhbWRncHVfam9iX3RpbWVkb3V0LT5k
cm1fZGV2X2lzX3VucGx1Z2dlZAo+Pj4+Pj4gd2lsbCByZXR1cm4gdHJ1ZSBhbmQgc28gaXQgd2ls
bCByZXR1cm4gZWFybHkuIFRvIG1ha2UgaXQgd2F0ZXIgCj4+Pj4+PiBwcm9vZiB0aWdodAo+Pj4+
Pj4gYWdhaW5zdCByYWNlCj4+Pj4+PiBpIGNhbiBzd2l0Y2ggZnJvbSBkcm1fZGV2X2lzX3VucGx1
Z2dlZCB0byBkcm1fZGV2X2VudGVyL2V4aXQKPj4+Pj4gSG0gdGhhdCdzIGNvbmZ1c2luZy4gWW91
IGRvIGEgd29ya19jYW5jZWxfc3luYywgc28gdGhhdCBhdCBsZWFzdCAKPj4+Pj4gbG9va3MKPj4+
Pj4gbGlrZSAidGRyIHdvcmsgbXVzdCBub3QgcnVuIGFmdGVyIHRoaXMgcG9pbnQiCj4+Pj4+Cj4+
Pj4+IElmIHlvdSBvbmx5IHJlbHkgb24gZHJtX2Rldl9lbnRlci9leGl0IGNoZWNrIHdpdGggdGhl
IHRkciB3b3JrLCB0aGVuCj4+Pj4+IHRoZXJlJ3Mgbm8gbmVlZCB0byBjYW5jZWwgYW55dGhpbmcu
Cj4+Pj4KPj4+PiBBZ3JlZSwgc3luY2hyb25pemVfc3JjdSBmcm9tIGRybV9kZXZfdW5wbHVnIHNo
b3VsZCBwbGF5IHRoZSByb2xlCj4+Pj4gb2YgJ2ZsdXNoaW5nJyBhbnkgZWFybGllciAoaW4gcHJv
Z3Jlc3MpIHRkciB3b3JrIHdoaWNoIGlzCj4+Pj4gdXNpbmcgZHJtX2Rldl9lbnRlci9leGl0IHBh
aXIuIEFueSBsYXRlciBhcmlzaW5nIHRkciB3aWxsIHRlcm1pbmF0ZSAKPj4+PiBlYXJseSB3aGVu
Cj4+Pj4gZHJtX2Rldl9lbnRlcgo+Pj4+IHJldHVybnMgZmFsc2UuCj4+PiBOb3BlLCBhbnl0aGlu
ZyB5b3UgcHV0IGludG8gdGhlIHdvcmsgaXRzZWxmIGNhbm5vdCBjbG9zZSB0aGlzIHJhY2UuCj4+
PiBJdCdzIHRoZSBzY2hlZHVsZV93b3JrIHRoYXQgbWF0dGVycyBoZXJlLiBPciBJJ20gbWlzc2lu
ZyBzb21ldGhpbmcgLi4uCj4+PiBJIHRob3VnaHQgdGhhdCB0aGUgdGRyIHdvcmsgeW91J3JlIGNh
bmNlbGxpbmcgaGVyZSBpcyBsYXVuY2hlZCBieQo+Pj4gZHJtL3NjaGVkdWxlciBjb2RlLCBub3Qg
YnkgdGhlIGFtZCBjYWxsYmFjaz8KPgo+Cj4gTXkgYmFkLCB5b3UgYXJlIHJpZ2h0LCBJIGFtIHN1
cHBvc2VkIHRvIHB1dCBkcm1fZGV2X2VudGVyLmV4aXQgcGFpciAKPiBpbnRvIGRybV9zY2hlZF9q
b2JfdGltZWRvdXQKPgo+Cj4+Cj4+IFllcyB0aGF0IGlzIGNvcnJlY3QuIENhbmNlbGluZyB0aGUg
d29yayBpdGVtIGlzIG5vdCB0aGUgcmlnaHQgCj4+IGFwcHJvYWNoIGF0IGFsbCwgbm9yIGlzIGFk
ZGluZyBkZXZfZW50ZXIvZXhpdCBwYWlyIGluIHRoZSByZWNvdmVyeSAKPj4gaGFuZGxlci4KPgo+
Cj4gV2l0aG91dCBhZGRpbmcgdGhlIGRldl9lbnRlci9leGl0IGd1YXJkaW5nIHBhaXIgaW4gdGhl
IHJlY292ZXJ5IAo+IGhhbmRsZXIgeW91IGFyZSBlbmRpbmcgdXAgd2l0aCBHUFUgcmVzZXQgc3Rh
cnRpbmcgd2hpbGUKPiB0aGUgZGV2aWNlIGlzIGFscmVhZHkgdW5wbHVnZ2VkLCB0aGlzIGxlYWRz
IHRvIG11bHRpcGxlIGVycm9ycyBhbmQgCj4gZ2VuZXJhbCBtZXNzLgo+Cj4KPj4KPj4gV2hhdCB3
ZSBuZWVkIHRvIGRvIGhlcmUgaXMgdG8gc3RvcCB0aGUgc2NoZWR1bGVyIHRocmVhZCBhbmQgdGhl
biB3YWl0IAo+PiBmb3IgYW55IHRpbWVvdXQgaGFuZGxpbmcgdG8gaGF2ZSBmaW5pc2hlZC4KPj4K
Pj4gT3RoZXJ3aXNlIGl0IGNhbiBzY2hlZHVsZXIgYSBuZXcgdGltZW91dCBqdXN0IGFmdGVyIHdl
IGhhdmUgY2FuY2VsZWQgCj4+IHRoaXMgb25lLgo+Pgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4u
Cj4KPgo+IFNjaGVkdWxlcnMgYXJlIHN0b3BwZWQgZnJvbSBhbWRncHVfZHJpdmVyX3VubG9hZF9r
bXMgd2hpY2ggaW5kZWVkIAo+IGhhcHBlbnMgYWZ0ZXIgZHJtX2Rldl91bnBsdWcKPiBzbyB5ZXMs
IHRoZXJlIGlzIHN0aWxsIGEgY2hhbmNlIGZvciBuZXcgd29yayBiZWluZyBzY2hlZHVsZXIgYW5k
IAo+IHRpbWVvdXQgYXJtZWQgYWZ0ZXIgYnV0LCBvbmNlIGkgZml4IHRoZSBjb2RlCj4gdG8gcGxh
Y2UgZHJtX2Rldl9lbnRlci9leGl0IHBhaXIgaW50byBkcm1fc2NoZWRfam9iX3RpbWVvdXQgSSBk
b24ndCAKPiBzZWUgd2h5IHRoYXQgbm90IGEgZ29vZCBzb2x1dGlvbiA/CgpZZWFoIHRoYXQgc2hv
dWxkIHdvcmsgYXMgd2VsbCwgYnV0IHRoZW4geW91IGFsc28gZG9uJ3QgbmVlZCB0byBjYW5jZWwg
CnRoZSB3b3JrIGl0ZW0gZnJvbSB0aGUgZHJpdmVyLgoKPiBBbnkgdGRyIHdvcmsgc3RhcnRlZCBh
ZnRlciBkcm1fZGV2X3VucGx1ZyBmaW5pc2hlZCB3aWxsIHNpbXBseSBhYm9ydCAKPiBvbiBlbnRy
eSB0byBkcm1fc2NoZWRfam9iX3RpbWVkb3V0Cj4gYmVjYXVzZSBkcm1fZGV2X2VudGVyIHdpbGwg
YmUgZmFsc2UgYW5kIHRoZSBmdW5jdGlvbiB3aWxsIHJldHVybiAKPiB3aXRob3V0IHJlYXJtaW5n
IHRoZSB0aW1lb3V0IHRpbWVyIGFuZAo+IHNvIHdpbGwgaGF2ZSBubyBpbXBhY3QuCj4KPiBUaGUg
b25seSBpc3N1ZSBpIHNlZSBoZXJlIG5vdyBpcyBvZiBwb3NzaWJsZSB1c2UgYWZ0ZXIgZnJlZSBp
ZiBzb21lIAo+IGxhdGUgdGRyIHdvcmsgd2lsbCB0cnkgdG8gZXhlY3V0ZSBhZnRlcgo+IGRybSBk
ZXZpY2UgYWxyZWFkeSBnb25lLCBmb3IgdGhpcyB3ZSBwcm9iYWJseSBzaG91bGQgYWRkIAo+IGNh
bmNlbF9kZWxheWVkX3dvcmtfc3luYyhzY2hlZC53b3JrX3RkcikKPiB0byBkcm1fc2NoZWRfZmlu
aSBhZnRlciBzY2hlZC0+dGhyZWFkIGlzIHN0b3BwZWQgdGhlcmUuCgpHb29kIHBvaW50LCB0aGF0
IGlzIGluZGVlZCBtaXNzaW5nIGFzIGZhciBhcyBJIGNhbiBzZWUuCgpDaHJpc3RpYW4uCgo+Cj4g
QW5kcmV5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
