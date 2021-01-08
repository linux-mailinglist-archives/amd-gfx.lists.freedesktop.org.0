Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928662EF924
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Jan 2021 21:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAD66E90D;
	Fri,  8 Jan 2021 20:24:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6456E8DC
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:59 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t16so10169475wra.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0Y2D14a+N1/DuGk1xLenDRRTJldnnwxnydDJYRlWZ0=;
 b=ii7134gA7Vw7PgBW2x9F5/fqdzcg9nwOHhEMgmTAPmloKouSet+Yv0Eh112bhn7tC8
 TsDFdsCmlo+upGbISJMmApS5v1F75lRJVXN/zBKixEhYHpU1ypv6LYXY7uKFXgz4hepX
 7MUTHY7finxZpnnkLpsLtHwGg3W4F5uah003asbdtFKBjR49ndtHUMOaGmzR7WKXkScz
 seeNxJKr3QNgQsJOsLOL+0eQb3NSDpD7LOfZuPb1p/pjFXQOSpGjFbk7/UM4Un6rAmPm
 bmL9pQ+p4ZIPy/wf00QO8fA+JT3rzOpDgjfbOGxNc09wvJJhZVLi7c67wJ80NU3LrqOC
 fqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0Y2D14a+N1/DuGk1xLenDRRTJldnnwxnydDJYRlWZ0=;
 b=RTIeGW+7qK9mrOUuUqd6FoWZ1QGV/AYBCMLDTpq40ZS5J0w0o5TsKV1uFFKGAbdgmr
 KDNHOmi+rYF0jfip2BhHsg9Kr8tbQu1FR7EggChOBSQXLqZAYBIQH3w/lshVvtMxWmb7
 CsikZRA0s9udFgQX3U8hB44eyNgQ8U4D1+mpC8gIroVX+TqxAqqtMsoDV1eLhSpsSSEI
 Tw+xmgRWEyaZ4y7Zf88SGT5PrYKeDl7tFYMsbHTU9nlDiDf/0yJviVa9zNBV7sx6/S9M
 xM2sSvpy8cIhaHu9oxOuooqYc/aOj0qdDZDX2W4v8BwiE2oNWYWtfH6Le4pBGCMMRLtp
 yI8g==
X-Gm-Message-State: AOAM530GRs9i7Y4y7TZb9+t13ui3nXIiAS0Px2yHO+W4IqB+VVLHWBGp
 w1ClT5TFprFr+UgG7oOgmPs7upPl2IDxiwhN
X-Google-Smtp-Source: ABdhPJwObQg4aMosXHGQaOTSPoyOU7tGYOlZDfP2HLlLOeKLNOkWLbj09CD2lTH55byrdi5rkELOAQ==
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr5461472wrb.28.1610136957815;
 Fri, 08 Jan 2021 12:15:57 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 37/40] drm/amd/display/dc/dce/dce_i2c_sw: Make a bunch of
 local functions static
Date: Fri,  8 Jan 2021 20:14:54 +0000
Message-Id: <20210108201457.3078600-38-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Jan 2021 20:24:14 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2kyY19zdy5jOjM0Mjo2
OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZV9pMmNfc3dfZW5naW5l
X3NldF9zcGVlZOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX3N3LmM6MzU2OjY6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlX2kyY19zd19lbmdpbmVfYWNxdWlyZV9lbmdp
bmXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY2UvZGNlX2kyY19zdy5jOjQwMDo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmGRjZV9pMmNfc3dfZW5naW5lX3N1Ym1pdF9jaGFubmVsX3JlcXVl
c3TigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY2UvZGNlX2kyY19zdy5jOjQ0Mzo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmGRjZV9pMmNfc3dfZW5naW5lX3N1Ym1pdF9wYXlsb2Fk4oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRA
YW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19zdy5jIHwgOSArKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX3N3LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfc3cuYwppbmRleCA4N2Q4NDI4ZGY2
YzQ2Li42ODQ2YWZkODM3MDFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9pMmNfc3cuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9pMmNfc3cuYwpAQCAtMzM5LDcgKzMzOSw3IEBAIHN0YXRpYyBib29sIHN0YXJ0
X3N5bmNfc3coCiAJcmV0dXJuIGZhbHNlOwogfQogCi12b2lkIGRjZV9pMmNfc3dfZW5naW5lX3Nl
dF9zcGVlZCgKK3N0YXRpYyB2b2lkIGRjZV9pMmNfc3dfZW5naW5lX3NldF9zcGVlZCgKIAlzdHJ1
Y3QgZGNlX2kyY19zdyAqZW5naW5lLAogCXVpbnQzMl90IHNwZWVkKQogewpAQCAtMzUzLDcgKzM1
Myw3IEBAIHZvaWQgZGNlX2kyY19zd19lbmdpbmVfc2V0X3NwZWVkKAogCQllbmdpbmUtPmNsb2Nr
X2RlbGF5ID0gMTI7CiB9CiAKLWJvb2wgZGNlX2kyY19zd19lbmdpbmVfYWNxdWlyZV9lbmdpbmUo
CitzdGF0aWMgYm9vbCBkY2VfaTJjX3N3X2VuZ2luZV9hY3F1aXJlX2VuZ2luZSgKIAlzdHJ1Y3Qg
ZGNlX2kyY19zdyAqZW5naW5lLAogCXN0cnVjdCBkZGMgKmRkYykKIHsKQEAgLTM5Nyw3ICszOTcs
NyBAQCBib29sIGRjZV9pMmNfZW5naW5lX2FjcXVpcmVfc3coCiAKIAogCi12b2lkIGRjZV9pMmNf
c3dfZW5naW5lX3N1Ym1pdF9jaGFubmVsX3JlcXVlc3QoCitzdGF0aWMgdm9pZCBkY2VfaTJjX3N3
X2VuZ2luZV9zdWJtaXRfY2hhbm5lbF9yZXF1ZXN0KAogCXN0cnVjdCBkY2VfaTJjX3N3ICplbmdp
bmUsCiAJc3RydWN0IGkyY19yZXF1ZXN0X3RyYW5zYWN0aW9uX2RhdGEgKnJlcSkKIHsKQEAgLTQ0
MCw3ICs0NDAsOCBAQCB2b2lkIGRjZV9pMmNfc3dfZW5naW5lX3N1Ym1pdF9jaGFubmVsX3JlcXVl
c3QoCiAJCUkyQ19DSEFOTkVMX09QRVJBVElPTl9TVUNDRUVERUQgOgogCQlJMkNfQ0hBTk5FTF9P
UEVSQVRJT05fRkFJTEVEOwogfQotYm9vbCBkY2VfaTJjX3N3X2VuZ2luZV9zdWJtaXRfcGF5bG9h
ZCgKKworc3RhdGljIGJvb2wgZGNlX2kyY19zd19lbmdpbmVfc3VibWl0X3BheWxvYWQoCiAJc3Ry
dWN0IGRjZV9pMmNfc3cgKmVuZ2luZSwKIAlzdHJ1Y3QgaTJjX3BheWxvYWQgKnBheWxvYWQsCiAJ
Ym9vbCBtaWRkbGVfb2ZfdHJhbnNhY3Rpb24pCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
