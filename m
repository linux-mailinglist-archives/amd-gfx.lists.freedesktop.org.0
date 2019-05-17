Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2021C03
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 18:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657E68986D;
	Fri, 17 May 2019 16:49:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3A18986D
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 16:49:43 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id j1so4811660qkk.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 09:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=YQKQHG4M8LPCgiVUmfj9FmemKS5kDVlDsFXEktM5iKg=;
 b=B5CUJ2zBw/uYQqvvnQ2dUnGTCvA47qRMZCsjEMdeBlXE1e94tDEfzSIN6JTfEuxCZy
 cFlq/tqr8d406Ws5efYc+ojnOC7eFdVs0euhsrS5j+FRtQ560sAuC+bJs5roD8yqMpcz
 HKLM/FNFgN5vc6fLJHJEKwA/muGEEdQBiQ0bIlTGdEmbJq/ql4lGqV6Fos5J9zmafXFU
 en480Pg/kQmM2KCDYhBjNzz3U5qFVzsdM0AHZxMux3NDr+DmlWAMkz8YebZ28I95vjUw
 fJPmN64m78M3r+baw0XcLpEpr6wQ35IHl0EfXLm8cBbSB+5CjLurl17DkKKY1EuBd9/B
 bQ9Q==
X-Gm-Message-State: APjAAAWgwy8FINXToWXfGhl4blzTisEp2VFfOhuDnMdtBm6OiR3gi4Xl
 GFNxkOh5hgPFelCxOklvikI=
X-Google-Smtp-Source: APXvYqzFyZGeD4zkiSZi3SkSlviqiDubb0dWZREOoe+X7AzBuTjEK1zRAB4f8AsM/c6uNGcqN5Q4RQ==
X-Received: by 2002:a37:4757:: with SMTP id u84mr46276252qka.16.1558111782553; 
 Fri, 17 May 2019 09:49:42 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::f042])
 by smtp.gmail.com with ESMTPSA id x18sm3812128qkh.87.2019.05.17.09.49.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 09:49:40 -0700 (PDT)
Date: Fri, 17 May 2019 09:49:37 -0700
From: Tejun Heo <tj@kernel.org>
To: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Subject: Re: [PATCH v2 0/4] AMDKFD (AMD GPU compute) support for device cgroup.
Message-ID: <20190517164937.GF374014@devbig004.ftw2.facebook.com>
References: <20190517161435.14121-1-Harish.Kasiviswanathan@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517161435.14121-1-Harish.Kasiviswanathan@amd.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YQKQHG4M8LPCgiVUmfj9FmemKS5kDVlDsFXEktM5iKg=;
 b=JlwEd6jJES5oT2oMM1N+aF88PCaJGZbVL2S00a/tVN7D1CWW1/zfUpn5cUuKGDaB9l
 UlF5XO7cIWukxFo6fDDiSa2oRQ55QLnfTtuyxfOk3YwoF/ymTPX0X5XIpWZp66wBEnXy
 HscvZjELUt+WRq5s3oYgfd+z33+tZ8m2fZePp06/ghenLSuYLNnf0U7K5yfSdgXTCVGK
 skLrlpDL+k2boNLwUmm/P2BrEo01J6egfCZKCOUQPpfaMu/knWnEmvHb7p0s2F1PJlr2
 DLqt5ye6VVOFlAR4N/Ut20/jku03Mhcmr4t1S7bYgCu0W/Ew0TJs+hLilSx/17a+35lb
 jing==
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6MTQ6NTJQTSArMDAwMCwgS2FzaXZpc3dhbmF0aGFu
LCBIYXJpc2ggd3JvdGU6Cj4gYW1ka2ZkIChwYXJ0IG9mIGFtZGdwdSkgZHJpdmVyIHN1cHBvcnRz
IHRoZSBBTUQgR1BVIGNvbXB1dGUgc3RhY2suCj4gYW1ka2ZkIGV4cG9zZXMgb25seSBhIHNpbmds
ZSBkZXZpY2UgL2Rldi9rZmQgZXZlbiBpZiBtdWx0aXBsZSBBTUQgR1BVCj4gKGNvbXB1dGUpIGRl
dmljZXMgZXhpc3QgaW4gYSBzeXN0ZW0uIEhvd2V2ZXIsIGFtZGdwdSBkcnZpZXIgZXhwb3NlcyBh
Cj4gc2VwYXJhdGUgcmVuZGVyIGRldmljZSBmaWxlIC9kZXYvZHJpL3JlbmRlckROIGZvciBlYWNo
IGRldmljZS4gVG8gcGFydGljaXBhdGUKPiBpbiBkZXZpY2UgY2dyb3VwIGFtZGtmZCBkcml2ZXIg
d2lsbCByZWx5IG9uIHRoZXNlIHJlZG5lciBkZXZpY2UgZmlsZXMuCj4gCj4gdjI6IEV4cG9ydGlu
ZyBkZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbigpIGluc3RlYWQgb2YKPiBfX2RldmNncm91cF9j
aGVja19wZXJtaXNzaW9uKCkgYXMgcGVyIHJldmlldyBjb21tZW50cy4KCkxvb2tzIGZpbmUgdG8g
bWUgYnV0IGdpdmVuIGhvdyBub24tb2J2aW91cyBpdCBpcywgc29tZSBkb2N1bWVudGF0aW9uCndv
dWxkIGJlIGdyZWF0LgoKVGhhbmtzLgoKLS0gCnRlanVuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
