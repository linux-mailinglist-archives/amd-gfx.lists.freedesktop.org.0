Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B810315E4D
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 09:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BA689E1B;
	Tue,  7 May 2019 07:36:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6DC89E1B
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 07:36:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w12so7329309wrp.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 00:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=olbZZkLgJZQ6TfR7yZE60fz+3SbDKEqreEN7omnp680=;
 b=rcA2alO4l3JdvLp9/jRwPnWp8TIntjh3O5CuZ3pn2jVhg5EZ5dbi9x6/4uGN+4LMH+
 RnO0T9K0Zqfvsb3I3gl2p1KvnjDRJdE1zTScHHJ3cQaM3v3v1XbokqRPE/85PUdhCdl3
 AdQQEN/X4n18W14mCJVPBbdk43Xssd0UxNzZxYSOhHb3Z/3Zs2gy4nnkPDhXqaXdzMx+
 0AdGjsPe2E3iioA2AL9xJlG6obtBIcNMHUgcA505SvfcZQjdYr6+1BXyJ3qW2cYQ/dAI
 TuNs7Ejv3vAFORh8fh5YrA3rAWSOUvuFN2LpGDK2V1bz8EC7wCYNGxnjbKlTyHRHwY2T
 nivw==
X-Gm-Message-State: APjAAAV1ah3qr8coBzJT33y9viV+WzmBjOjXzKOXABt0OEBsc2ZIexyv
 +ZFrf85kj+LVWX4G4VG05fLgb6Ni
X-Google-Smtp-Source: APXvYqxDUf/oVobxhtpIFoU9He1fUGKfJk/lO+SPyZCJUr+A6amUQC++eaCCiXk7INLIH0cYEZNERw==
X-Received: by 2002:adf:f351:: with SMTP id e17mr17708370wrp.85.1557214605627; 
 Tue, 07 May 2019 00:36:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 91sm21119236wrs.43.2019.05.07.00.36.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 00:36:44 -0700 (PDT)
Subject: Re: [PATCH 0/2] Skip IH re-route on Vega SR-IOV
To: Trigger Huang <Trigger.Huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1b5b40b0-0d3c-8374-f423-5c50617fca9a@gmail.com>
Date: Tue, 7 May 2019 09:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=olbZZkLgJZQ6TfR7yZE60fz+3SbDKEqreEN7omnp680=;
 b=W6pCRqbIHsDYjhu/uvUQmmSqLElxygLDjDMHkdFYPxc3p6iTqL1n4MeIHy7IFKh5o9
 3x4MdNItq675ypgfhn3CgDTTwjl14a6EM0Gzistntr2WSgLIPDEXDPxQ73CDJoGSSAcu
 mbb+rRsHPi+/8nS8hggLPhkAGAuLd8fn8nQYXXm2llgxCc0zza6hFLzVfGO+xRvXbAhc
 i56SEza2CkbblDvSYBcxZnA43pse0kGAIPFHzgG5Z2AujZGiK3koG8lAoRmmXvN9F5c+
 w06OaiSqCOJ7V1e8SF06FT78sio/FZYgo7dzdlA3ermyS+TLgjrw6DCL3SXgGv/I9yDH
 N/1w==
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

V2UgaW50ZW50aW9uYWxseSBkaWRuJ3QgZG8gdGhpcyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgY29t
bWFuZHMgYXJlIAppZ25vcmVkIGJ5IHRoZSBQU1AgZmlybXdhcmUuCgpJIGhhdmUgbm8gc3Ryb25n
IG9waW5pb24gb24gaWYgd2Ugc2hvdWxkIGRvIHRoaXMgb3Igbm90LCBidXQgdGhlIFBTUCAKZmly
bXdhcmUgZ3V5cyBtaWdodCBoYXZlLgoKQ2hyaXN0aWFuLgoKQW0gMDcuMDUuMTkgdW0gMDY6MDgg
c2NocmllYiBUcmlnZ2VyIEh1YW5nOgo+IElIIHJlLXJvdXRlIGlzIG5vdCBzdXBwb3J0ZWQgb24g
VmVnYSBTUi1JT1YsIG5lZWQgdG8gYmUgc2tpcHBlZAo+Cj4gVHJpZ2dlciBIdWFuZyAoMik6Cj4g
ICAgZHJtL2FtZGdwdTogU2tpcCBJSCByZXJvdXRlIGluIFZlZ2ExMCBTUi1JT1YgVkYKPiAgICBk
cm0vYW1kZ3B1OiBTa2lwIElIIHJlcm91dGUgaW4gVmVnYTIwIFNSLUlPViBWRgo+Cj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDQgKysrKwo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyAgfCA0ICsrKysKPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
