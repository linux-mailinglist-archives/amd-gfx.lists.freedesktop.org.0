Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D506F461E7
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 17:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B758930A;
	Fri, 14 Jun 2019 15:00:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C268930A
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 15:00:46 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so3892941edr.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 08:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=NbFRe8iz8+YgXTd9+j/Su+erCoaDy3fGkGP7auiuNUA=;
 b=CY0hVlZxh9VZDtookXL6wsBi0vHvhAu0Qu8DUOo10RbOKNWWrPOpc7fctsEx+wTUPj
 aFh6f2AviBMvtXTp5xb9kRzsq6Ij93wAMdX30kpR9Mu5hgmTf15SSV+h7RK+i7YANBeZ
 AT2IFOGKfRKo/ZLWi5LGhLKwicgs1y2W9HtBYxKGrt2xiG896MgugN1WeRKCh8mOBS7K
 H4ai7ubtGLqhX9ZuOErkrC8auLnQiggFEjEkUA4m/f3dpK2+gIYMEB4fC9x0c6bTa5P3
 qrmx6J0VBunK1Ln8W4HmhQhHXyDP1zEiFd101KrF82SB9hPk7BdvQzeGsg2JUjKA9gPG
 3JMA==
X-Gm-Message-State: APjAAAUMqikd3UYLaaf3hLTxvKWVnwZTZZ+Wo86mzpaX+uz6rTqmL5dJ
 LillsV49epvXwjFzdpxjxpK/wQ==
X-Google-Smtp-Source: APXvYqzbUincpkS9VRFPqctb2mtBCQ81/I0YaGNHD6rsk2qXjiGZJEqf/FLbTjm8dLd6boMGMh27sg==
X-Received: by 2002:a17:906:4e57:: with SMTP id
 g23mr10186023ejw.52.1560524444771; 
 Fri, 14 Jun 2019 08:00:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 17sm962988edu.21.2019.06.14.08.00.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 08:00:43 -0700 (PDT)
Date: Fri, 14 Jun 2019 17:00:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Young Xiao <92siuyang@gmail.com>
Subject: Re: [PATCH] drm/amd: fix hotplug race at startup
Message-ID: <20190614150041.GA23020@phenom.ffwll.local>
Mail-Followup-To: Young Xiao <92siuyang@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1560511763-2140-1-git-send-email-92siuyang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560511763-2140-1-git-send-email-92siuyang@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NbFRe8iz8+YgXTd9+j/Su+erCoaDy3fGkGP7auiuNUA=;
 b=bMvCQCY1CEGJuCCTGphkCQCQDXbBiiOzKD2MHOjDq+l9sETlfAVva1PsQHnRf2oUGN
 M5o0BI9D4sRZY9xNMHZwuhH8HqA0pR3KYSUbrT4aFt/AOsxxvjk9BZkDeqOL6uUKUt/2
 lfg6y+DC2kF7XSnWHwQW2J1I6e61GDiKl3nik=
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
Cc: David1.Zhou@amd.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDc6Mjk6MjNQTSArMDgwMCwgWW91bmcgWGlhbyB3cm90
ZToKPiBXZSBzaG91bGQgY2hlY2sgbW9kZV9jb25maWdfaW5pdGlhbGl6ZWQgZmxhZyBpbiBhbWRn
cHVfaG90cGx1Z193b3JrX2Z1bmMuCj4gCj4gU2VlIGNvbW1pdCA3Zjk4Y2E0NTRhZDMgKCJkcm0v
cmFkZW9uOiBmaXggaG90cGx1ZyByYWNlIGF0IHN0YXJ0dXAiKSBmb3IgZGV0YWlscy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBZb3VuZyBYaWFvIDw5MnNpdXlhbmdAZ21haWwuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMgfCAzICsrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pcnEuYwo+IGluZGV4IGFmNGMzYjEuLjEzMTg2ZDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCj4gQEAgLTg1LDYgKzg1LDkgQEAgc3RhdGljIHZvaWQg
YW1kZ3B1X2hvdHBsdWdfd29ya19mdW5jKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCXN0
cnVjdCBkcm1fbW9kZV9jb25maWcgKm1vZGVfY29uZmlnID0gJmRldi0+bW9kZV9jb25maWc7Cj4g
IAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ICAKPiArCWlmICghYWRldi0+bW9k
ZV9pbmZvLm1vZGVfY29uZmlnX2luaXRpYWxpemVkKQo+ICsJCXJldHVybjsKCkkgdGhpbmsgeW91
IHdhbnQgdG8gZGVsYXkgeW91ciBob3RwbHVnIGluaXRpYWxpemF0aW9uIHVudGlsIHlvdSdyZSBy
ZWFkeQp0byBzZXJ2ZSBob3RwbHVnIGV2ZW50cywgdGhpcyBoZXJlIGlzIGZhaXJseSByYWN5IC4u
LgotRGFuaWVsCgo+ICsKPiAgCW11dGV4X2xvY2soJm1vZGVfY29uZmlnLT5tdXRleCk7Cj4gIAls
aXN0X2Zvcl9lYWNoX2VudHJ5KGNvbm5lY3RvciwgJm1vZGVfY29uZmlnLT5jb25uZWN0b3JfbGlz
dCwgaGVhZCkKPiAgCQlhbWRncHVfY29ubmVjdG9yX2hvdHBsdWcoY29ubmVjdG9yKTsKPiAtLSAK
PiAyLjcuNAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
