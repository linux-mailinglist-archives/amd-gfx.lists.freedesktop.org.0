Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C71391825
	for <lists+amd-gfx@lfdr.de>; Wed, 26 May 2021 14:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2AE6ECE7;
	Wed, 26 May 2021 12:57:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D176E4C5
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 08:47:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x7so166890wrt.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qrtEkiWPh1VsC0TCpSiXhurw/AoAcdO+uVVz+pBsZfQ=;
 b=ezhWvGsdrmBxcn9brdcQNASBFzEUTDY+CWlPgn0LfRwhFwjnRx1C0WPMxVEA3cgFqx
 WNqu7WDp6Md98NycpVBE0w/QwtnsWHdzC2G/PMJF/Pj0oZYQaE2FRO2OKiuUJtb3e+Us
 q/x37uy5grJyPcj8LwAYfYfKDw4HSnk1YD9ub9NF6LKYv3FFhFH4EYk6M8sY3G9lvsrI
 Rp98ZAsTPJuUjduDt8a717DmOenksFyeISlJYJrDv+53r7X/TmADYbGRizlOS94//FBy
 qhpNPhsEEQoeRoyfwdYWCK8H6vamKnyAczb2BX5tZn9JpqB9FSs54fYUpPfH4b9poA5u
 jwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qrtEkiWPh1VsC0TCpSiXhurw/AoAcdO+uVVz+pBsZfQ=;
 b=H6ZfJ6Zp9za1G+TQZaOv/7KDLLx3yd0lNLlsyIk8BrhITjG33QWgq3ZHU0+NnvbZZF
 6hJAPqV74Xiwlwp56riTp+aPFqmt62vXdcB8rA0IwiTfxr6weGIJOWfw35j2t6SJf3+T
 qwI/EIV30egP9RYL+iCEiNt6P5G706cMNDaXOt7Re4Sg8PsSqkbw2rq436P7eUTMSJdC
 gH2gZK8pNP2K1UkF7RzJGryZUjfoD83Tdf2sZG7s64EYzrSZyDTu6S+feKQM+Q97O0LP
 P/LVqmvlULMcnfAAMp+eAIBmJkZRUL9/Dmm/ZFM4pwIJBOdY7QjY2VAxYW1d/qP5ch/J
 Ikrg==
X-Gm-Message-State: AOAM531YB+sMZU8Ynp2TAjlVbLvdjkad7ZuYMmLkF6u1hrYs4oTjzSfl
 Sdg/IMv1zx26C6wng7q4jeNrug==
X-Google-Smtp-Source: ABdhPJzZzHw3tZBUns2t0+wWPmVsHNPAlKPZ4UZNuMBF9U/LCq6esrCB+KvyMAs+4MnFN1yCu4+QBw==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr30586678wri.8.1622018856595;
 Wed, 26 May 2021 01:47:36 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/34] drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Kernel-doc
 headers must contain function names
Date: Wed, 26 May 2021 09:46:58 +0100
Message-Id: <20210526084726.552052-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 May 2021 12:57:23 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5j
OjU0Nzogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0cyB3aXRoICcvKionLCBidXQgaXNuJ3Qg
YSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5l
bC1kb2MucnN0CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTEwX2h3bWdyLmM6NjAzOiB3YXJuaW5nOiBUaGlzIGNvbW1lbnQgc3RhcnRzIHdpdGgg
Jy8qKicsIGJ1dCBpc24ndCBhIGtlcm5lbC1kb2MgY29tbWVudC4gUmVmZXIgRG9jdW1lbnRhdGlv
bi9kb2MtZ3VpZGUva2VybmVsLWRvYy5yc3QKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYzo2Mjk6IHdhcm5pbmc6IFRoaXMgY29t
bWVudCBzdGFydHMgd2l0aCAnLyoqJywgYnV0IGlzbid0IGEga2VybmVsLWRvYyBjb21tZW50LiBS
ZWZlciBEb2N1bWVudGF0aW9uL2RvYy1ndWlkZS9rZXJuZWwtZG9jLnJzdAogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOjEwMDY6
IHdhcm5pbmc6IFRoaXMgY29tbWVudCBzdGFydHMgd2l0aCAnLyoqJywgYnV0IGlzbid0IGEga2Vy
bmVsLWRvYyBjb21tZW50LiBSZWZlciBEb2N1bWVudGF0aW9uL2RvYy1ndWlkZS9rZXJuZWwtZG9j
LnJzdAogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3Zl
Z2ExMF9od21nci5jOjExNTU6IHdhcm5pbmc6IFRoaXMgY29tbWVudCBzdGFydHMgd2l0aCAnLyoq
JywgYnV0IGlzbid0IGEga2VybmVsLWRvYyBjb21tZW50LiBSZWZlciBEb2N1bWVudGF0aW9uL2Rv
Yy1ndWlkZS9rZXJuZWwtZG9jLnJzdAogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0v
cG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOjE2MDg6IHdhcm5pbmc6IGV4cGVjdGluZyBw
cm90b3R5cGUgZm9yIFBvcHVsYXRlcyBzaW5nbGUgU01DIEdGWFNDTEsgc3RydWN0dXJlIHVzaW5n
IHRoZSBwcm92aWRlZCBlbmdpbmUgY2xvY2soKS4gUHJvdG90eXBlIHdhcyBmb3IgdmVnYTEwX3Bv
cHVsYXRlX3NpbmdsZV9nZnhfbGV2ZWwoKSBpbnN0ZWFkCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmM6MTY2Mzogd2FybmluZzog
VGhpcyBjb21tZW50IHN0YXJ0cyB3aXRoICcvKionLCBidXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNv
bW1lbnQuIFJlZmVyIERvY3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0CiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmM6MTcxMzogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0cyB3aXRoICcvKionLCBidXQgaXNu
J3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3VtZW50YXRpb24vZG9jLWd1aWRlL2tl
cm5lbC1kb2MucnN0CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkv
aHdtZ3IvdmVnYTEwX2h3bWdyLmM6MTg2Mjogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0cyB3
aXRoICcvKionLCBidXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3VtZW50
YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmM6MjU0Njogd2FybmluZzogZXhw
ZWN0aW5nIHByb3RvdHlwZSBmb3IgSW5pdGlhbGl6ZXMgdGhlIFNNQyB0YWJsZSBhbmQgdXBsb2Fk
cyBpdCgpLiBQcm90b3R5cGUgd2FzIGZvciB2ZWdhMTBfaW5pdF9zbWNfdGFibGUoKSBpbnN0ZWFk
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEw
X2h3bWdyLmM6MjkyMjogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0cyB3aXRoICcvKionLCBi
dXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3VtZW50YXRpb24vZG9jLWd1
aWRlL2tlcm5lbC1kb2MucnN0CgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0t
CiAuLi4vZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgfCAyNiArKysr
KysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkv
aHdtZ3IvdmVnYTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYwppbmRleCAzMWM2MWFjM2JkNWUxLi4yNTk3OTEwNmZkMjU1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBf
aHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdh
MTBfaHdtZ3IuYwpAQCAtNTQ0LDcgKzU0NCw3IEBAIHN0YXRpYyBpbnQgdmVnYTEwX2dldF9zb2Nj
bGtfZm9yX3ZvbHRhZ2VfZXZ2KHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAKICNkZWZpbmUgQVRP
TV9WSVJUVUFMX1ZPTFRBR0VfSUQwICAgICAgICAgICAgIDB4ZmYwMQogLyoqCi0gKiBHZXQgTGVh
a2FnZSBWRERDIGJhc2VkIG9uIGxlYWthZ2UgSUQuCisgKiB2ZWdhMTBfZ2V0X2V2dl92b2x0YWdl
cyAtIEdldCBMZWFrYWdlIFZEREMgYmFzZWQgb24gbGVha2FnZSBJRC4KICAqCiAgKiBAaHdtZ3I6
ICB0aGUgYWRkcmVzcyBvZiB0aGUgcG93ZXJwbGF5IGhhcmR3YXJlIG1hbmFnZXIuCiAgKiByZXR1
cm46ICBhbHdheXMgMC4KQEAgLTYwMCw3ICs2MDAsNyBAQCBzdGF0aWMgaW50IHZlZ2ExMF9nZXRf
ZXZ2X3ZvbHRhZ2VzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB9CiAKIC8qKgotICogQ2hhbmdl
IHZpcnR1YWwgbGVha2FnZSB2b2x0YWdlIHRvIGFjdHVhbCB2YWx1ZS4KKyAqIHZlZ2ExMF9wYXRj
aF93aXRoX3ZkZF9sZWFrYWdlIC0gQ2hhbmdlIHZpcnR1YWwgbGVha2FnZSB2b2x0YWdlIHRvIGFj
dHVhbCB2YWx1ZS4KICAqCiAgKiBAaHdtZ3I6ICAgICAgICAgdGhlIGFkZHJlc3Mgb2YgdGhlIHBv
d2VycGxheSBoYXJkd2FyZSBtYW5hZ2VyLgogICogQHZvbHRhZ2U6ICAgICAgIHBvaW50ZXIgdG8g
Y2hhbmdpbmcgdm9sdGFnZQpAQCAtNjI2LDcgKzYyNiw3IEBAIHN0YXRpYyB2b2lkIHZlZ2ExMF9w
YXRjaF93aXRoX3ZkZF9sZWFrYWdlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiB9CiAKIC8qKgot
ICogUGF0Y2ggdm9sdGFnZSBsb29rdXAgdGFibGUgYnkgRVZWIGxlYWthZ2VzLgorICogdmVnYTEw
X3BhdGNoX2xvb2t1cF90YWJsZV93aXRoX2xlYWthZ2UgLSBQYXRjaCB2b2x0YWdlIGxvb2t1cCB0
YWJsZSBieSBFVlYgbGVha2FnZXMuCiAgKgogICogQGh3bWdyOiAgICAgICAgIHRoZSBhZGRyZXNz
IG9mIHRoZSBwb3dlcnBsYXkgaGFyZHdhcmUgbWFuYWdlci4KICAqIEBsb29rdXBfdGFibGU6ICBw
b2ludGVyIHRvIHZvbHRhZ2UgbG9va3VwIHRhYmxlCkBAIC0xMDAzLDcgKzEwMDMsNyBAQCBzdGF0
aWMgaW50IHZlZ2ExMF9zZXR1cF9hc2ljX3Rhc2soc3RydWN0IHBwX2h3bWdyICpod21ncikKIH0K
IAogLyoqCi0gKiBSZW1vdmUgcmVwZWF0ZWQgdm9sdGFnZSB2YWx1ZXMgYW5kIGNyZWF0ZSB0YWJs
ZSB3aXRoIHVuaXF1ZSB2YWx1ZXMuCisgKiB2ZWdhMTBfdHJpbV92b2x0YWdlX3RhYmxlIC0gUmVt
b3ZlIHJlcGVhdGVkIHZvbHRhZ2UgdmFsdWVzIGFuZCBjcmVhdGUgdGFibGUgd2l0aCB1bmlxdWUg
dmFsdWVzLgogICoKICAqIEBod21ncjogICAgICB0aGUgYWRkcmVzcyBvZiB0aGUgcG93ZXJwbGF5
IGhhcmR3YXJlIG1hbmFnZXIuCiAgKiBAdm9sX3RhYmxlOiAgdGhlIHBvaW50ZXIgdG8gY2hhbmdp
bmcgdm9sdGFnZSB0YWJsZQpAQCAtMTE1Miw3ICsxMTUyLDcgQEAgc3RhdGljIHZvaWQgdmVnYTEw
X3RyaW1fdm9sdGFnZV90YWJsZV90b19maXRfc3RhdGVfdGFibGUoCiB9CiAKIC8qKgotICogQ3Jl
YXRlIFZvbHRhZ2UgVGFibGVzLgorICogdmVnYTEwX2NvbnN0cnVjdF92b2x0YWdlX3RhYmxlcyAt
IENyZWF0ZSBWb2x0YWdlIFRhYmxlcy4KICAqCiAgKiBAaHdtZ3I6ICB0aGUgYWRkcmVzcyBvZiB0
aGUgcG93ZXJwbGF5IGhhcmR3YXJlIG1hbmFnZXIuCiAgKiByZXR1cm46ICBhbHdheXMgMApAQCAt
MTU5NSw3ICsxNTk1LDggQEAgc3RhdGljIGludCB2ZWdhMTBfcG9wdWxhdGVfc21jX2xpbmtfbGV2
ZWxzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB9CiAKIC8qKgotICogUG9wdWxhdGVzIHNpbmds
ZSBTTUMgR0ZYU0NMSyBzdHJ1Y3R1cmUgdXNpbmcgdGhlIHByb3ZpZGVkIGVuZ2luZSBjbG9jawor
ICogdmVnYTEwX3BvcHVsYXRlX3NpbmdsZV9nZnhfbGV2ZWwgLSBQb3B1bGF0ZXMgc2luZ2xlIFNN
QyBHRlhTQ0xLIHN0cnVjdHVyZQorICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1c2luZyB0aGUgcHJvdmlkZWQgZW5naW5lIGNsb2NrCiAgKgogICogQGh3bWdyOiAgICAgIHRo
ZSBhZGRyZXNzIG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyCiAgKiBAZ2Z4X2Nsb2NrOiAgdGhlIEdG
WCBjbG9jayB0byB1c2UgdG8gcG9wdWxhdGUgdGhlIHN0cnVjdHVyZS4KQEAgLTE2NjAsNyArMTY2
MSw4IEBAIHN0YXRpYyBpbnQgdmVnYTEwX3BvcHVsYXRlX3NpbmdsZV9nZnhfbGV2ZWwoc3RydWN0
IHBwX2h3bWdyICpod21nciwKIH0KIAogLyoqCi0gKiBQb3B1bGF0ZXMgc2luZ2xlIFNNQyBTT0ND
TEsgc3RydWN0dXJlIHVzaW5nIHRoZSBwcm92aWRlZCBjbG9jay4KKyAqIHZlZ2ExMF9wb3B1bGF0
ZV9zaW5nbGVfc29jX2xldmVsIC0gUG9wdWxhdGVzIHNpbmdsZSBTTUMgU09DQ0xLIHN0cnVjdHVy
ZQorICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1c2luZyB0aGUgcHJvdmlk
ZWQgY2xvY2suCiAgKgogICogQGh3bWdyOiAgICAgdGhlIGFkZHJlc3Mgb2YgdGhlIGhhcmR3YXJl
IG1hbmFnZXIuCiAgKiBAc29jX2Nsb2NrOiB0aGUgU09DIGNsb2NrIHRvIHVzZSB0byBwb3B1bGF0
ZSB0aGUgc3RydWN0dXJlLgpAQCAtMTcxMCw3ICsxNzEyLDggQEAgc3RhdGljIGludCB2ZWdhMTBf
cG9wdWxhdGVfc2luZ2xlX3NvY19sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogfQogCiAv
KioKLSAqIFBvcHVsYXRlcyBhbGwgU01DIFNDTEsgbGV2ZWxzJyBzdHJ1Y3R1cmUgYmFzZWQgb24g
dGhlIHRyaW1tZWQgYWxsb3dlZCBkcG0gZW5naW5lIGNsb2NrIHN0YXRlcworICogdmVnYTEwX3Bv
cHVsYXRlX2FsbF9ncmFwaGljX2xldmVscyAtIFBvcHVsYXRlcyBhbGwgU01DIFNDTEsgbGV2ZWxz
JyBzdHJ1Y3R1cmUKKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiYXNl
ZCBvbiB0aGUgdHJpbW1lZCBhbGxvd2VkIGRwbSBlbmdpbmUgY2xvY2sgc3RhdGVzCiAgKgogICog
QGh3bWdyOiAgICAgIHRoZSBhZGRyZXNzIG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyCiAgKi8KQEAg
LTE4NTksNyArMTg2Miw4IEBAIHN0YXRpYyBpbnQgdmVnYTEwX3BvcHVsYXRlX3NpbmdsZV9tZW1v
cnlfbGV2ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwKIH0KIAogLyoqCi0gKiBQb3B1bGF0ZXMg
YWxsIFNNQyBNQ0xLIGxldmVscycgc3RydWN0dXJlIGJhc2VkIG9uIHRoZSB0cmltbWVkIGFsbG93
ZWQgZHBtIG1lbW9yeSBjbG9jayBzdGF0ZXMuCisgKiB2ZWdhMTBfcG9wdWxhdGVfYWxsX21lbW9y
eV9sZXZlbHMgLSBQb3B1bGF0ZXMgYWxsIFNNQyBNQ0xLIGxldmVscycgc3RydWN0dXJlCisgKiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiYXNlZCBvbiB0aGUgdHJpbW1lZCBh
bGxvd2VkIGRwbSBtZW1vcnkgY2xvY2sgc3RhdGVzLgogICoKICAqIEBod21ncjogIHRoZSBhZGRy
ZXNzIG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgogICogcmV0dXJuOiAgIFBQX1Jlc3VsdF9PSyBv
biBzdWNjZXNzLgpAQCAtMjUzNyw3ICsyNTQxLDcgQEAgc3RhdGljIHZvaWQgdmVnYTEwX2NoZWNr
X2RwbV90YWJsZV91cGRhdGVkKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB9CiAKIC8qKgotICog
SW5pdGlhbGl6ZXMgdGhlIFNNQyB0YWJsZSBhbmQgdXBsb2FkcyBpdAorICogdmVnYTEwX2luaXRf
c21jX3RhYmxlIC0gSW5pdGlhbGl6ZXMgdGhlIFNNQyB0YWJsZSBhbmQgdXBsb2FkcyBpdAogICoK
ICAqIEBod21ncjogIHRoZSBhZGRyZXNzIG9mIHRoZSBwb3dlcnBsYXkgaGFyZHdhcmUgbWFuYWdl
ci4KICAqIHJldHVybjogIGFsd2F5cyAwCkBAIC0yOTE5LDcgKzI5MjMsNyBAQCBzdGF0aWMgaW50
IHZlZ2ExMF9zdG9wX2RwbShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCB1aW50MzJfdCBiaXRtYXAp
CiB9CiAKIC8qKgotICogVGVsbCBTTUMgdG8gZW5hYmxlZCB0aGUgc3VwcG9ydGVkIERQTXMuCisg
KiB2ZWdhMTBfc3RhcnRfZHBtIC0gVGVsbCBTTUMgdG8gZW5hYmxlZCB0aGUgc3VwcG9ydGVkIERQ
TXMuCiAgKgogICogQGh3bWdyOiAgIHRoZSBhZGRyZXNzIG9mIHRoZSBwb3dlcnBsYXkgaGFyZHdh
cmUgbWFuYWdlci4KICAqIEBiaXRtYXA6ICBiaXRtYXAgZm9yIHRoZSBmZWF0dXJlcyB0byBlbmFi
bGVkLgotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
