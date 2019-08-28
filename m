Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD314A02BB
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD4189C5E;
	Wed, 28 Aug 2019 13:12:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF37E89C51
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:43:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 10so2628798wmp.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 05:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qd6ey11z/wINe110U9BdGySenGE1Ur+iNDqKV4OJUZE=;
 b=rN839xERDufVidEjlEdtia1DSpTmjeixh+XDKCTeqAwCGdfelUpSqI08J2808erOAx
 xGKcC0Z72s9Mq8GUlLoYiRHHBTczU9uA0ZnGIE93WER/hedJ4yOBZ7d1Mk9TCxoRRH1f
 m7LPhkwfhnGh2Pdr5ZlIHqsPOHXwzlx9CPBE3TnH81Oxrp2LWe5EESW2fI3ksVnEucxB
 oXjk0QU5IcKtj52d1IVruozE0lmk/29vo5pKHH1GJY/tEvQWFBVQflZzWwGIQXdTCgni
 RV6zR8IfiiUYcEgajZ5/6vYN8XlyUZsB8yD5pMse2dQZ0n0u/mJVZZcnW64iV4RCAnXV
 10eQ==
X-Gm-Message-State: APjAAAUGJN89ReH2sj9DECXCFWLMC3s0Vkk+WdmxZ+bl89ycdn2DWAGk
 RuFGL53DS2lYqNKS2/Bq8k11q7rn
X-Google-Smtp-Source: APXvYqwFpTFkKEsi4Aupm6Z+gDWwa6PHuTE4yyoTEHx0nzRCCkZgHJ0hY3hhUgXwFKBLautTKuXsOw==
X-Received: by 2002:a1c:f703:: with SMTP id v3mr4544165wmh.107.1566996187028; 
 Wed, 28 Aug 2019 05:43:07 -0700 (PDT)
Received: from kontron.lan
 (2001-1ae9-0ff1-f191-3428-f576-7c9a-b44c.ip6.tmcz.cz.
 [2001:1ae9:ff1:f191:3428:f576:7c9a:b44c])
 by smtp.gmail.com with ESMTPSA id s192sm2551183wme.17.2019.08.28.05.43.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 05:43:06 -0700 (PDT)
Subject: Re: [RFC] AMD polaris MEM_AP_SIZE location (PCI BAR aperture size)
To: christian.koenig@amd.com
References: <b5ce72c4-850d-1024-354c-2542045b8992@gmail.com>
 <0a40c024-84fb-a726-b69c-f2a5349fc802@gmail.com>
From: Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <22bd05eb-ac42-3157-33a7-26bd77979c36@gmail.com>
Date: Wed, 28 Aug 2019 14:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0a40c024-84fb-a726-b69c-f2a5349fc802@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Aug 2019 13:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qd6ey11z/wINe110U9BdGySenGE1Ur+iNDqKV4OJUZE=;
 b=raUpPtcoD76BLB9m6lE9eW10OJO/rZ1HOdXOE73f8miZUpeXGbh2aObXe3ocdTQwT0
 p9t8S+/jjGdPFScqQSo7ut0RjvajxZgLPz1r7aDLrPen03u7m3e/FEirpFPGyfidbOjD
 1BrKyLHYou8/+MktEuur3stdt8/SX/F20+PmL5hkrOwDhUE064O3nwXXKFjeO3MMdphE
 8TfhN4wAlvWZzH3LpRNNj55xWPJsvJz9hW8mrYS2Ag22K46Ia6dCVPHRvhmnKguZ5Er+
 nh89W6yb3Vup07j6yu3jLpmBQAiEiUC055DIEblsTndIwYGjmMHWQtVW0UL+l0YLKuhh
 tIFQ==
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG5lIDI4LiAwOC4gMTkgdiAxMDozMSBDaHJpc3RpYW4gS8O2bmlnIG5hcHNhbChhKToKPiBIaSBQ
ZXRyLAo+IAo+IHdlbGwgdGhhdCBpcyBpbmRlZWQgYSByYXRoZXIgdW51c3VhbCB1c2UgY2FzZS4K
PiAKPiBJJ20gbm90IDEwMCUgc3VyZSBob3cgeW91IGFjdHVhbGx5IGhhY2tlZCB0aGUgSEQ0NTUw
IHRvIGRvIHdoYXQgeW91IHdhbnQgdG8gZG8sIGNhdXNlIHRoaXMgQVNJQyBnZW5lcmF0aW9uIHNo
b3VsZG4ndCBzdXBwb3J0IHRoaXMuCgpJIGRvbid0IHJlbWVtYmVyIGNvcnJlY3RseSBob3cgZXhh
Y3RseSBJJ3ZlIG1hbmFnZWQgdG8gZG8gdGhhdCBidXQgSSB0aGluayB0aGUgcHJvY2VzcyB3YXM6
IAoKSSBjb21wYXJlZCBkaWZmZXJlbnQgQklPU2VzIGZpcnN0IGFuZCBJIGZvdW5kIGEgY29ycmVs
YXRpb24gYmV0d2VlbiBhcGVydHVyZSBzaXplcyBpbiB0aGUgUk9NIGltYWdlcyBvZiBvbGRlciAo
eDEzMDAvUjUyMCkgZ2VuZXJhdGlvbi4gV2hpbGUgZG9pbmcgdGhhdCBJJ3ZlIGZvdW5kIG1lbnRp
b25zIG9mIE1FTV9BUF9TSVpFIFJPTSBwb3dlcnVwIHN0cmFwIHJlZ2lzdGVycyAoZnJvbSB4Lm9y
ZyBkb2N1bWVudHMpIGFuZCBJIHRyaWVkIHRvIGZsYXNoIHRoZSBzZXR0aW5ncyBvZiBIRDQ1NTAg
ZnJvbSAyNTZNQiAoZGVmYXVsdCkgZGlyZWN0bHkgdG8gNjRNQiBhbmQgSSB3YXMgc3VycHJpc2Vk
IGl0IHdvcmtlZCAoSSd2ZSB0aG91Z2ggaXQgd2lsbCBiZSBvbmx5IDEyOE1CKS4gSUYgSSBnb29n
bGUgdGhlICJNRU1fQVBfU0laRSIgbm93IEkgY2FuIGZpbmQgYSBkb2N1bWVudCBbMV0sIHdoaWNo
IHNheXMgKHBhZ2UgNTYpIHRoZSBST00gYWRkcmVzcyBpcyAweDc4IChwYWdlIDU2KSBhbmQgdGhl
IHRhYmxlIHNheXMgNjRNQiBpcyBwb3NzaWJsZSwgd2hpY2ggYm90aCBtYXRjaCB0aGUgZXhwZXJp
bWVudC4KCk9mIGNvdXJzZSB0aGUgYmlvcyBpcyBub3cgQ1JDIGJyb2tlbiwgYnV0IGl0IGRvZXNu
J3QgbWF0dGVyIGluIGxpbnV4ICh0aGUgUk9NIGNvZGUgaXMganVzdCB4ODYgYW55d2F5KS4KClsx
XSBodHRwczovL2Rldi54ZGV2cy5jb20vYXR0YWNobWVudHMvZG93bmxvYWQvMjMzL0FNRF9SVjcx
MF9kc19uZGFfMS4wMWIucGRmCgo+IAo+IEZvciBhIFBvbGFyaXMgeW91IGNhbiBqdXN0IHVzZSB0
aGUgUENJZSByZXNpemVhYmxlIEJBUiBleHRlbnNpb24uIEZvciBob3cgdG8gdXNlIGl0IHNlZSB0
aGUgcGNpX3Jlc2l6ZV9yZXNvdXJjZSgpIGZ1bmN0aW9uIGluIHRoZSBsaW51eCBrZXJuZWwuCj4g
Cj4gUGxlYXNlIGJlIGF3YXJlIHRoYXQgd2UgdXN1YWxseSB1c2UgdGhlIGZ1bmN0aW9uIHRvIGlu
Y3JlYXNlIHRoZSBCQVIgc2l6ZSB0byBhbGxvdyB0aGUgQ1BVIHRvIGFjY2VzcyBtb3JlIG9mIHRo
ZSBvbiBib2FyZCBtZW1vcnksIHNvIG1ha2luZyBpdCBzbWFsbGVyIG1pZ2h0IGFjdHVhbGx5IG5v
dCBiZSB0ZXN0ZWQgYXQgYWxsLgoKWWVhaCBidXQgc2FkbHkgaXQgc2VlbXMgaXQgaXMgcG9zc2li
bGUgdG8gb25seSBpbmNyZWFzZSB0aGUgQkFSIHNpemUgZnJvbSBpdHMgY3VycmVudGx5IGRlZmF1
bHQgMjU2TUIuCgo+IAo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+IAo+IAo+IEFtIDI3LjA4LjE5
IHVtIDA0OjM2IHNjaHJpZWIgUGV0ciBDdmVrOgo+PiBIZWxsbywKPj4KPj4gSSdtIHRyeWluZyB0
byBydW4gQU1EIEdQVXMgaW4gdW51c3VhbCBjb25maWd1cmF0aW9ucy4gSSB3YXMgYWJsZSB0byBk
ZWNyZWFzZSB0aGUgUENJIEJBUiBzaXplIGluIEhENDU1MCBieSBpdHMgQklPUyBzdHJhcCBjb25m
aWd1cmF0aW9uIGFuZCBjaGFuZ2UgaXQgdG8gNjRNQiAoYW5kIEkgd2FzIGFibGUgdG8gcnVuIGl0
IG9uIE1JUFMgdm9jb3JlMiBib2FyZCA6LUQgKS4gSXMgdGhlcmUgYSBzaW1pbGFyIGNvbmZpZ3Vy
YXRpb24gbG9jYXRpb24gZm9yIEFNRCBwb2xhcmlzIDExL1JYIDQ2MCBCSU9TPwo+Pgo+PiBQZXRy
IEN2ZWsKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
