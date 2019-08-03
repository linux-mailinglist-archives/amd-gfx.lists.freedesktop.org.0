Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B680413
	for <lists+amd-gfx@lfdr.de>; Sat,  3 Aug 2019 05:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E8D6E439;
	Sat,  3 Aug 2019 03:12:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6606E439
 for <amd-gfx@lists.freedesktop.org>; Sat,  3 Aug 2019 03:11:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id s3so69665689wms.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 02 Aug 2019 20:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xOlgxezjIoq3JtrV74LBpHJcRyWhgCg3/w15BK6lZWo=;
 b=uPjX8ASIrECqTR/AEb3KI6adgIgp1Ax4BzGjVbxKJT+ujNWEmTobcR7Hv+E3n7h+kw
 GKaQBxFavM0ya648eyw4SAew2aflpzkbwpPWw/V+LHwRaddgloqdBVI9SRlyWR2754OM
 NfiAhVgFTdroI5Y4yHF2rBfRMqqX9ruH8hkRNI7tkU/HhICSddVCmiISrgIovUw/Hi28
 EoRviLgwVcWWQPLXaMDbBvmBNnmbmmTDEL/ucju4AW29/9QIIUWR5EvJdQPGKA0DyKAM
 DlIIuZPIiwYZMDpq9edgt9x9AwDu+P2Lx3qJ8vSWJb9UHw+M0Oqxzh1cpeZkQYkpIKTm
 N7RQ==
X-Gm-Message-State: APjAAAXX7TogH8fsOgLCcgoZi9/UrROZmTGRwLBGahv7mVE/wZ7sWgof
 D6x7c0QVhVpdKKF4SvSXvLKIf+6FALo8jnvZqdRXEQ==
X-Google-Smtp-Source: APXvYqwZQePEeGTc7fARSVjnaryXU25GoC7KfNOLiPtcBoJ7hPrsTPyx0fVGlxwrqTXSx2Fdd+mUUbW/KPOpQsidIzo=
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr6844313wme.102.1564801916200; 
 Fri, 02 Aug 2019 20:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <BN8PR12MB30575C1E9879A42284CB5CFEF6DF0@BN8PR12MB3057.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB30575C1E9879A42284CB5CFEF6DF0@BN8PR12MB3057.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Aug 2019 23:11:43 -0400
Message-ID: <CADnq5_OVKMmxK8A9+6Fkm2o9x5_ZBM=ekV2j-uSwFV4_iXVyQQ@mail.gmail.com>
Subject: Re: libdrm patch merge request
To: "Ma, Le" <Le.Ma@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xOlgxezjIoq3JtrV74LBpHJcRyWhgCg3/w15BK6lZWo=;
 b=mA4cbzVH0ejoJaBdywvq9GP4gxwGF+LCS5QPx6YuTI7Qnh73SyaQLEVb3hZlIIS/XM
 Pj9oa54yOYZXFG5h/7qAlfjf64HNm12UqFlpHhm55/tP1KP3r+fV+gy11KmSJwEbKKrk
 8LVI9Zz+QnwWLeADZqnKwVmv8wGH9Ef2iat0USHQfM6cJuN/WGLLVHHGUiZLRlUF3mp4
 /4G83mZ9kkXsg2ZxrApCyC0Q+If4WCyBP4mnjjHksAm/fswBd4JwA0KS25JWu+JiZhw/
 +3qXuza+bFTAajjixtr3UwLGNigWbPYAJe53Ych4EDb8VaK5TvraML3N/1z39tBOCsyz
 fbQw==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Cui,
 Flora" <Flora.Cui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG9uZS4gIFNvcnJ5IGZvciB0aGUgZGVsYXkuCgpBbGV4CgpPbiBUdWUsIEp1bCAzMCwgMjAxOSBh
dCAxMDo1OCBQTSBNYSwgTGUgPExlLk1hQGFtZC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleCwKPgo+
Cj4KPiBDb3VsZCB5b3UgaGVscCB0byBtZXJnZSBmb2xsb3dpbmcgMiByZXZpZXdlZCBwYXRjaGVz
IG9uIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9sZW1hMS9kcm0vY29tbWl0cy9sZW1h
MS9kcm0gaW50byBkcm0gbWFzdGVyIGJyYW5jaCA/Cj4KPiB0ZXN0cy9hbWRncHU6IGRpc2FibGUg
cmVzZXQgdGVzdCBmb3Igbm93Cj4gdGVzdHMvYW1kZ3B1OiBkaXZpZGUgZGlzcGF0Y2ggdGVzdCBp
bnRvIGNvbXB1dGUgYW5kIGdmeAo+Cj4KPgo+IFRoYW5rcy4KPgo+Cj4KPiBSZWdhcmRzLAo+Cj4g
TWEgTGUKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
