Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90412B1D55
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 15:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4123E6E554;
	Fri, 13 Nov 2020 14:28:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C386E50D
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so8549217wmh.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z/8viFdCzNWHnSXDW2EunFyaI/d41Skp7gtV6qeYb0o=;
 b=y+C8gxmn2CgNAthyNMnIAqnLUwLH4naZTgbJSpTdoD73gKQFGYgWDnZ8/pu87+N3My
 3Z5QYUXjogsA6are0/qHHGs4Pm0ky8IDgD4q2wVolPvVk9/7del+06HVnzXbYLOsHnUa
 y0utOgFt23KAzeKXkP+hksNHB1PME8rQ5hy5mBy5L9BcrtbzhrfoNl5TFsuG+eSAP9Bk
 Y5grD862KHbiX5jvyYjwoXCt6Ebdc45fMNWMs9Cv+wBzoQ/OmOEU+mdYUzLj8waneUZk
 8IyfzinwFH/5AyA44qCDXcQd9ew9kVyAGMfWkII3O5JuO9AJhBbU+lB/6BZ2oXTa2IfF
 ohFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/8viFdCzNWHnSXDW2EunFyaI/d41Skp7gtV6qeYb0o=;
 b=gIflNeWJRDQk77HSDNBYlP1v4rp4xCLhIlKKFIgD7iu1r6aSKUn7H9RhTBU5Rk54Iq
 YpUcVEdkHWByIMFQWH7uYhnsX2EGfqmcq0C/ITFVkLrcRhhU4H5eEPouYXCfvZc/OnWE
 g6kKh5Wim3CwYlOE7vj9L5tFbYVpRIIM1XNZNveZKQd5ORyO9EzQxXM80GMRPUNEOJHl
 +HqjpXtH9D32gKlC4PuxHf7pnevLnQDuXNNG2s/r2CCN4Ra0iFsPZ/yT+1GphSTC5qSz
 hy3K09+JcW8Tp5SZ3QTmLSD5m9RJMsMGyS2LjVGQp6MBaa7eL4UfPJKr7l44/FRW+Hyb
 QZxw==
X-Gm-Message-State: AOAM5305W41uBOnDYeD9foUyQ0jcn4wEKcpqYDHwuju9vz6hC8FOwdoS
 lS/MVKyaCBbMy7mKD4ORY2Hh0Q==
X-Google-Smtp-Source: ABdhPJwrqmZ4GNbkeACVm1/vQC7L1XX7aXP5n5VW3GuHBkUyDAqenITmqVUTAfPhLM0Fyok02x3AOw==
X-Received: by 2002:a1c:2842:: with SMTP id o63mr2652810wmo.59.1605275386536; 
 Fri, 13 Nov 2020 05:49:46 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/40] drm/amd/display/dc/core/dc_link_ddc: Move
 DP_DVI_CONVERTER_ID_{4, 5} to where they're used
Date: Fri, 13 Nov 2020 13:49:01 +0000
Message-Id: <20201113134938.4004947-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Nov 2020 14:28:19 +0000
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

VGhpcyBwYXRjaCBmaXhlcyA+MjAwIHdhcm5pbmdzLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEg
a2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzozMToKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oOjEyNjoyMjog
d2FybmluZzog4oCYRFBfRFZJX0NPTlZFUlRFUl9JRF814oCZIGRlZmluZWQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiAxMjYgfCBzdGF0aWMgY29uc3QgdWludDhfdCBE
UF9EVklfQ09OVkVSVEVSX0lEXzVbXSA9ICIzMzkzTjIiOwogfCBefn5+fn5+fn5+fn5+fn5+fn5+
fn4KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2Vy
dmljZV90eXBlcy5oOjEyNToyMjogd2FybmluZzog4oCYRFBfRFZJX0NPTlZFUlRFUl9JRF804oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiAxMjUgfCBz
dGF0aWMgY29uc3QgdWludDhfdCBEUF9EVklfQ09OVkVSVEVSX0lEXzRbXSA9ICJtMkRWSWEiOwog
fCBefn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxh
bmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMgICAgICAgfCA0ICsrKysK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5cGVzLmgg
fCA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmtfZGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2Rk
Yy5jCmluZGV4IDU0YmVkYTRkNGU4NWQuLmM1OTM2ZTA2NDM2MDYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYwpAQCAtMzcsNiArMzcs
MTAgQEAKICNpbmNsdWRlICJkY19saW5rX2RkYy5oIgogI2luY2x1ZGUgImRjZS9kY2VfYXV4Lmgi
CiAKKy8qRFAgdG8gRHVhbCBsaW5rIERWSSBjb252ZXJ0ZXIqLworc3RhdGljIGNvbnN0IHVpbnQ4
X3QgRFBfRFZJX0NPTlZFUlRFUl9JRF80W10gPSAibTJEVklhIjsKK3N0YXRpYyBjb25zdCB1aW50
OF90IERQX0RWSV9DT05WRVJURVJfSURfNVtdID0gIjMzOTNOMiI7CisKICNkZWZpbmUgQVVYX1BP
V0VSX1VQX1dBX0RFTEFZIDUwMAogI2RlZmluZSBJMkNfT1ZFUl9BVVhfREVGRVJfV0FfREVMQVkg
NzAKICNkZWZpbmUgSTJDX09WRVJfQVVYX0RFRkVSX1dBX0RFTEFZXzFNUyAxCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMu
aAppbmRleCBiNDUzY2U1YTliZmRiLi40ZGU1OWI2NmJiMWEzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5cGVzLmgKQEAg
LTExNyw4ICsxMTcsNCBAQCBzdHJ1Y3QgYXZfc3luY19kYXRhIHsKIAl1aW50OF90IGF1ZF9kZWxf
aW5zMzsvKiBEUENEIDAwMDJEaCAqLwogfTsKIAotLypEUCB0byBEdWFsIGxpbmsgRFZJIGNvbnZl
cnRlciovCi1zdGF0aWMgY29uc3QgdWludDhfdCBEUF9EVklfQ09OVkVSVEVSX0lEXzRbXSA9ICJt
MkRWSWEiOwotc3RhdGljIGNvbnN0IHVpbnQ4X3QgRFBfRFZJX0NPTlZFUlRFUl9JRF81W10gPSAi
MzM5M04yIjsKLQogI2VuZGlmIC8qIF9fREFMX0REQ19TRVJWSUNFX1RZUEVTX0hfXyAqLwotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
