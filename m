Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D476A2C62B6
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Nov 2020 11:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C416EB90;
	Fri, 27 Nov 2020 10:14:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063E56E948
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r3so2214864wrt.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJ48BnAFuIYXRbLOjlTsHmoQNdzeeMH8+iEVcNp9LRw=;
 b=irhFLR+D7PHiZmn27CayKxpHC+pspRcPPxBdS39NIWI1a1AtvgPFGv1+GKKx7263iY
 OF6nv8G3JtBO5NxqtncSSzSt0O5Kxp54ywhxmA/qVsGyeNSpdfYQyURlg8Dll8XkVSuh
 0GTu5Ok7Oll9qvpzpd+tL20UWO0nKxHiBJv9lGLVykcWC73tOgo4PbxN0U5XVazzA6KD
 2TzPexCvYD2WiKh84ClrArAA8ixmghure9qvs8p6u/f+XIEVoBZwhRrl0PZnwO/RcbmE
 vO4xFDL7xwqjciD/I8NYHJ+PcUhxtnQbH3HtpfRiLn595SDbPYOnYvBQYqgx/b7nZh5w
 hHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJ48BnAFuIYXRbLOjlTsHmoQNdzeeMH8+iEVcNp9LRw=;
 b=Eav+P1H0jlOqJGkuVQtxRjNOshUg10O/jFRbv7wsgA0DAkLVtkXzIStN8YubW6KDx4
 h3DTH5vhQ0PJ7uCb9BQWn22XrBUoMIOKgX1kd3OF8MOvENPvGO0oKBDkk1uNtH1LKfEO
 z3kV0WsJMSqVm71nUMFtz9LLQ6ORUz7ZEnZ6F8ZL4qlTSlAH7LCHsHcOk3D3OZgLauw+
 YHNktihx9ANteXzoJsB+NtFhzhWEyd56ccvDU/cpsYRu80N2sqCAXC6nXhhNJjwYLXoQ
 G+Afdqhcuck4TZrRqLM5v7qgAbmKAAJUOILwKRy2hxktRYhvmvn/hz9KTArTvLCj2Kca
 GpLg==
X-Gm-Message-State: AOAM531EKMoN4Tmcz+R2NH4uV3epy6RaWSmz7UQCnMqqgdnniaNbmZE9
 9xJzJ2xgOXpdrBwach+iKntEjGgdR10QjKDV
X-Google-Smtp-Source: ABdhPJyBWPP7GLsGLVwS/IL9jApgh75kjijq4JKQlg1qMhleCsPjU6MQ3Ci3aAZZpO3cFw+MWjErbA==
X-Received: by 2002:adf:f608:: with SMTP id t8mr4051594wrp.72.1606398193594;
 Thu, 26 Nov 2020 05:43:13 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/40] drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0:
 Convert to proper kernel-doc format
Date: Thu, 26 Nov 2020 13:42:18 +0000
Message-Id: <20201126134240.3214176-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:14:32 +0000
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJs
ZXNfdjFfMC5jOjQxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21n
cicgbm90IGRlc2NyaWJlZCBpbiAnc2V0X2h3X2NhcCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYzo0MTogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc2V0SXQnIG5vdCBkZXNjcmliZWQg
aW4gJ3NldF9od19jYXAnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBs
YXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmM6NDE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2NhcCcgbm90IGRlc2NyaWJlZCBpbiAnc2V0X2h3X2NhcCcKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3Bw
dGFibGVzX3YxXzAuYzo1Njogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
aHdtZ3InIG5vdCBkZXNjcmliZWQgaW4gJ3NldF9wbGF0Zm9ybV9jYXBzJwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNfdjFf
MC5jOjU2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdwb3dlcnBsYXlf
Y2Fwcycgbm90IGRlc2NyaWJlZCBpbiAnc2V0X3BsYXRmb3JtX2NhcHMnCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8w
LmM6MTM1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90
IGRlc2NyaWJlZCBpbiAnZ2V0X3Bvd2VycGxheV90YWJsZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYzoyMDI6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2h3bWdyJyBub3QgZGVzY3Jp
YmVkIGluICdnZXRfcGxhdGZvcm1fcG93ZXJfbWFuYWdlbWVudF90YWJsZScKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3Yx
XzAuYzoyMDI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2F0b21fcHBt
X3RhYmxlJyBub3QgZGVzY3JpYmVkIGluICdnZXRfcGxhdGZvcm1fcG93ZXJfbWFuYWdlbWVudF90
YWJsZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9w
cm9jZXNzX3BwdGFibGVzX3YxXzAuYzoyNDY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2h3bWdyJyBub3QgZGVzY3JpYmVkIGluICdpbml0X2RwbV8yX3BhcmFtZXRlcnMn
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vz
c19wcHRhYmxlc192MV8wLmM6MjQ2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdwb3dlcnBsYXlfdGFibGUnIG5vdCBkZXNjcmliZWQgaW4gJ2luaXRfZHBtXzJfcGFyYW1l
dGVycycKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9w
cm9jZXNzX3BwdGFibGVzX3YxXzAuYzo3OTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2h3bWdyJyBub3QgZGVzY3JpYmVkIGluICdpbml0X2Nsb2NrX3ZvbHRhZ2VfZGVw
ZW5kZW5jeScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21n
ci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYzo3OTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ3Bvd2VycGxheV90YWJsZScgbm90IGRlc2NyaWJlZCBpbiAnaW5pdF9jbG9j
a192b2x0YWdlX2RlcGVuZGVuY3knCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9w
b3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmM6OTExOiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90IGRlc2NyaWJlZCBpbiAnaW5pdF90
aGVybWFsX2NvbnRyb2xsZXInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dl
cnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmM6OTExOiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdwb3dlcnBsYXlfdGFibGUnIG5vdCBkZXNjcmliZWQgaW4g
J2luaXRfdGhlcm1hbF9jb250cm9sbGVyJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
cG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNfdjFfMC5jOjExMjE6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2h3bWdyJyBub3QgZGVzY3JpYmVkIGluICdj
aGVja19wb3dlcnBsYXlfdGFibGVzJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0v
cG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNfdjFfMC5jOjExMjE6IHdhcm5pbmc6IEZ1
bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3Bvd2VycGxheV90YWJsZScgbm90IGRlc2NyaWJl
ZCBpbiAnY2hlY2tfcG93ZXJwbGF5X3RhYmxlcycKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYzoxMjYzOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90IGRlc2NyaWJlZCBp
biAnbWFrZV9jbGFzc2lmaWNhdGlvbl9mbGFncycKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYzoxMjYzOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjbGFzc2lmaWNhdGlvbicgbm90IGRl
c2NyaWJlZCBpbiAnbWFrZV9jbGFzc2lmaWNhdGlvbl9mbGFncycKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYzox
MjYzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjbGFzc2lmaWNhdGlv
bjInIG5vdCBkZXNjcmliZWQgaW4gJ21ha2VfY2xhc3NpZmljYXRpb25fZmxhZ3MnCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxl
c192MV8wLmM6MTM3MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaHdt
Z3InIG5vdCBkZXNjcmliZWQgaW4gJ2dldF9wb3dlcnBsYXlfdGFibGVfZW50cnlfdjFfMCcKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3Bw
dGFibGVzX3YxXzAuYzoxMzcwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdlbnRyeV9pbmRleCcgbm90IGRlc2NyaWJlZCBpbiAnZ2V0X3Bvd2VycGxheV90YWJsZV9lbnRy
eV92MV8wJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdy
L3Byb2Nlc3NfcHB0YWJsZXNfdjFfMC5jOjEzNzA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ3Bvd2VyX3N0YXRlJyBub3QgZGVzY3JpYmVkIGluICdnZXRfcG93ZXJwbGF5
X3RhYmxlX2VudHJ5X3YxXzAnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dl
cnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmM6MTM3MDogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnY2FsbF9iYWNrX2Z1bmMnIG5vdCBkZXNjcmliZWQgaW4g
J2dldF9wb3dlcnBsYXlfdGFibGVfZW50cnlfdjFfMCcKCkNjOiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIC4uLi9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8w
LmMgICB8IDgxICsrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspLCA0MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNfdjFfMC5jCmluZGV4
IDgwMWE1NjUwMjY3MDMuLjc0MWUwM2FkNTMxMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNfdjFfMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNfdjFf
MC5jCkBAIC0zMiwxMCArMzIsMTAgQEAKICNpbmNsdWRlICJwcHRhYmxlX3YxXzAuaCIKIAogLyoq
Ci0gKiBQcml2YXRlIEZ1bmN0aW9uIHVzZWQgZHVyaW5nIGluaXRpYWxpemF0aW9uLgotICogQHBh
cmFtIGh3bWdyIFBvaW50ZXIgdG8gdGhlIGhhcmR3YXJlIG1hbmFnZXIuCi0gKiBAcGFyYW0gc2V0
SXQgQSBmbGFnIGluZGljYXRpb24gaWYgdGhlIGNhcGFiaWxpdHkgc2hvdWxkIGJlIHNldCAoVFJV
RSkgb3IgcmVzZXQgKEZBTFNFKS4KLSAqIEBwYXJhbSBjYXAgV2hpY2ggY2FwYWJpbGl0eSB0byBz
ZXQvcmVzZXQuCisgKiBzZXRfaHdfY2FwIC0gUHJpdmF0ZSBGdW5jdGlvbiB1c2VkIGR1cmluZyBp
bml0aWFsaXphdGlvbi4KKyAqIEBod21ncjogUG9pbnRlciB0byB0aGUgaGFyZHdhcmUgbWFuYWdl
ci4KKyAqIEBzZXRJdDogQSBmbGFnIGluZGljYXRpb24gaWYgdGhlIGNhcGFiaWxpdHkgc2hvdWxk
IGJlIHNldCAoVFJVRSkgb3IgcmVzZXQgKEZBTFNFKS4KKyAqIEBjYXA6IFdoaWNoIGNhcGFiaWxp
dHkgdG8gc2V0L3Jlc2V0LgogICovCiBzdGF0aWMgdm9pZCBzZXRfaHdfY2FwKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IsIGJvb2wgc2V0SXQsIGVudW0gcGhtX3BsYXRmb3JtX2NhcHMgY2FwKQogewpA
QCAtNDcsMTAgKzQ3LDEwIEBAIHN0YXRpYyB2b2lkIHNldF9od19jYXAoc3RydWN0IHBwX2h3bWdy
ICpod21nciwgYm9vbCBzZXRJdCwgZW51bSBwaG1fcGxhdGZvcm1fY2FwCiAKIAogLyoqCi0gKiBQ
cml2YXRlIEZ1bmN0aW9uIHVzZWQgZHVyaW5nIGluaXRpYWxpemF0aW9uLgotICogQHBhcmFtIGh3
bWdyIFBvaW50ZXIgdG8gdGhlIGhhcmR3YXJlIG1hbmFnZXIuCi0gKiBAcGFyYW0gcG93ZXJwbGF5
X2NhcHMgdGhlIGJpdCBhcnJheSAoZnJvbSBCSU9TKSBvZiBjYXBhYmlsaXR5IGJpdHMuCi0gKiBA
ZXhjZXB0aW9uIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGFsd2F5cyByZXR1cm5zIDEuCisg
KiBzZXRfcGxhdGZvcm1fY2FwcyAtIFByaXZhdGUgRnVuY3Rpb24gdXNlZCBkdXJpbmcgaW5pdGlh
bGl6YXRpb24uCisgKiBAaHdtZ3I6IFBvaW50ZXIgdG8gdGhlIGhhcmR3YXJlIG1hbmFnZXIuCisg
KiBAcG93ZXJwbGF5X2NhcHM6IHRoZSBiaXQgYXJyYXkgKGZyb20gQklPUykgb2YgY2FwYWJpbGl0
eSBiaXRzLgorICogRXhjZXB0aW9uOiAgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gYWx3YXlz
IHJldHVybnMgMS4KICAqLwogc3RhdGljIGludCBzZXRfcGxhdGZvcm1fY2FwcyhzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyLCB1aW50MzJfdCBwb3dlcnBsYXlfY2FwcykKIHsKQEAgLTEyOCw3ICsxMjgs
NyBAQCBzdGF0aWMgaW50IHNldF9wbGF0Zm9ybV9jYXBzKHN0cnVjdCBwcF9od21nciAqaHdtZ3Is
IHVpbnQzMl90IHBvd2VycGxheV9jYXBzKQogCXJldHVybiAwOwogfQogCi0vKioKKy8qCiAgKiBQ
cml2YXRlIEZ1bmN0aW9uIHRvIGdldCB0aGUgUG93ZXJQbGF5IFRhYmxlIEFkZHJlc3MuCiAgKi8K
IHN0YXRpYyBjb25zdCB2b2lkICpnZXRfcG93ZXJwbGF5X3RhYmxlKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IpCkBAIC0xOTEsMTAgKzE5MSwxMCBAQCBzdGF0aWMgaW50IGdldF92ZGRjX2xvb2t1cF90
YWJsZSgKIH0KIAogLyoqCi0gKiBQcml2YXRlIEZ1bmN0aW9uIHVzZWQgZHVyaW5nIGluaXRpYWxp
emF0aW9uLgorICogZ2V0X3BsYXRmb3JtX3Bvd2VyX21hbmFnZW1lbnRfdGFibGUgLSBQcml2YXRl
IEZ1bmN0aW9uIHVzZWQgZHVyaW5nIGluaXRpYWxpemF0aW9uLgogICogSW5pdGlhbGl6ZSBQbGF0
Zm9ybSBQb3dlciBNYW5hZ2VtZW50IFBhcmFtZXRlciB0YWJsZQotICogQHBhcmFtIGh3bWdyIFBv
aW50ZXIgdG8gdGhlIGhhcmR3YXJlIG1hbmFnZXIuCi0gKiBAcGFyYW0gYXRvbV9wcG1fdGFibGUg
UG9pbnRlciB0byBQUE0gdGFibGUgaW4gVkJJT1MKKyAqIEBod21ncjogUG9pbnRlciB0byB0aGUg
aGFyZHdhcmUgbWFuYWdlci4KKyAqIEBhdG9tX3BwbV90YWJsZTogUG9pbnRlciB0byBQUE0gdGFi
bGUgaW4gVkJJT1MKICAqLwogc3RhdGljIGludCBnZXRfcGxhdGZvcm1fcG93ZXJfbWFuYWdlbWVu
dF90YWJsZSgKIAkJc3RydWN0IHBwX2h3bWdyICpod21nciwKQEAgLTIzNCwxMCArMjM0LDEwIEBA
IHN0YXRpYyBpbnQgZ2V0X3BsYXRmb3JtX3Bvd2VyX21hbmFnZW1lbnRfdGFibGUoCiB9CiAKIC8q
KgotICogUHJpdmF0ZSBGdW5jdGlvbiB1c2VkIGR1cmluZyBpbml0aWFsaXphdGlvbi4KKyAqIGlu
aXRfZHBtXzJfcGFyYW1ldGVycyAtIFByaXZhdGUgRnVuY3Rpb24gdXNlZCBkdXJpbmcgaW5pdGlh
bGl6YXRpb24uCiAgKiBJbml0aWFsaXplIFREUCBsaW1pdHMgZm9yIERQTTIKLSAqIEBwYXJhbSBo
d21nciBQb2ludGVyIHRvIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgotICogQHBhcmFtIHBvd2VycGxh
eV90YWJsZSBQb2ludGVyIHRvIHRoZSBQb3dlclBsYXkgVGFibGUuCisgKiBAaHdtZ3I6IFBvaW50
ZXIgdG8gdGhlIGhhcmR3YXJlIG1hbmFnZXIuCisgKiBAcG93ZXJwbGF5X3RhYmxlOiBQb2ludGVy
IHRvIHRoZSBQb3dlclBsYXkgVGFibGUuCiAgKi8KIHN0YXRpYyBpbnQgaW5pdF9kcG1fMl9wYXJh
bWV0ZXJzKAogCQlzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLApAQCAtNzc5LDEwICs3NzksMTAgQEAg
c3RhdGljIGludCBnZXRfZ3Bpb190YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCXJldHVy
biAwOwogfQogLyoqCi0gKiBQcml2YXRlIEZ1bmN0aW9uIHVzZWQgZHVyaW5nIGluaXRpYWxpemF0
aW9uLgorICogaW5pdF9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3kgLSBQcml2YXRlIEZ1bmN0aW9u
IHVzZWQgZHVyaW5nIGluaXRpYWxpemF0aW9uLgogICogSW5pdGlhbGl6ZSBjbG9jayB2b2x0YWdl
IGRlcGVuZGVuY3kKLSAqIEBwYXJhbSBod21nciBQb2ludGVyIHRvIHRoZSBoYXJkd2FyZSBtYW5h
Z2VyLgotICogQHBhcmFtIHBvd2VycGxheV90YWJsZSBQb2ludGVyIHRvIHRoZSBQb3dlclBsYXkg
VGFibGUuCisgKiBAaHdtZ3I6IFBvaW50ZXIgdG8gdGhlIGhhcmR3YXJlIG1hbmFnZXIuCisgKiBA
cG93ZXJwbGF5X3RhYmxlOiBQb2ludGVyIHRvIHRoZSBQb3dlclBsYXkgVGFibGUuCiAgKi8KIHN0
YXRpYyBpbnQgaW5pdF9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3koCiAJCXN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsCkBAIC04NzEsMTUgKzg3MSwxNiBAQCBzdGF0aWMgaW50IGluaXRfY2xvY2tfdm9s
dGFnZV9kZXBlbmRlbmN5KAogCXJldHVybiByZXN1bHQ7CiB9CiAKLS8qKiBSZXRyaWV2ZXMgdGhl
IChzaWduZWQpIE92ZXJkcml2ZSBsaW1pdHMgZnJvbSBWQklPUy4KKy8qKgorICogaW5pdF9vdmVy
X2RyaXZlX2xpbWl0cyAtIFJldHJpZXZlcyB0aGUgKHNpZ25lZCkgT3ZlcmRyaXZlIGxpbWl0cyBm
cm9tIFZCSU9TLgogICogVGhlIG1heCBlbmdpbmUgY2xvY2ssIG1lbW9yeSBjbG9jayBhbmQgbWF4
IHRlbXBlcmF0dXJlIGNvbWUgZnJvbSB0aGUgZmlybXdhcmUgaW5mbyB0YWJsZS4KICAqCiAgKiBU
aGUgaW5mb3JtYXRpb24gaXMgcGxhY2VkIGludG8gdGhlIHBsYXRmb3JtIGRlc2NyaXB0b3IuCiAg
KgotICogQHBhcmFtIGh3bWdyIHNvdXJjZSBvZiB0aGUgVkJJT1MgdGFibGUgYW5kIG93bmVyIG9m
IHRoZSBwbGF0Zm9ybSBkZXNjcmlwdG9yIHRvIGJlIHVwZGF0ZWQuCi0gKiBAcGFyYW0gcG93ZXJw
bGF5X3RhYmxlIHRoZSBhZGRyZXNzIG9mIHRoZSBQb3dlclBsYXkgdGFibGUuCisgKiBAaHdtZ3I6
IHNvdXJjZSBvZiB0aGUgVkJJT1MgdGFibGUgYW5kIG93bmVyIG9mIHRoZSBwbGF0Zm9ybSBkZXNj
cmlwdG9yIHRvIGJlIHVwZGF0ZWQuCisgKiBAcG93ZXJwbGF5X3RhYmxlOiB0aGUgYWRkcmVzcyBv
ZiB0aGUgUG93ZXJQbGF5IHRhYmxlLgogICoKLSAqIEByZXR1cm4gMSBhcyBsb25nIGFzIHRoZSBm
aXJtd2FyZSBpbmZvIHRhYmxlIHdhcyBwcmVzZW50IGFuZCBvZiBhIHN1cHBvcnRlZCB2ZXJzaW9u
LgorICogUmV0dXJuOiAxIGFzIGxvbmcgYXMgdGhlIGZpcm13YXJlIGluZm8gdGFibGUgd2FzIHBy
ZXNlbnQgYW5kIG9mIGEgc3VwcG9ydGVkIHZlcnNpb24uCiAgKi8KIHN0YXRpYyBpbnQgaW5pdF9v
dmVyX2RyaXZlX2xpbWl0cygKIAkJc3RydWN0IHBwX2h3bWdyICpod21nciwKQEAgLTg5OCwxMSAr
ODk5LDExIEBAIHN0YXRpYyBpbnQgaW5pdF9vdmVyX2RyaXZlX2xpbWl0cygKIH0KIAogLyoqCi0g
KiBQcml2YXRlIEZ1bmN0aW9uIHVzZWQgZHVyaW5nIGluaXRpYWxpemF0aW9uLgorICogaW5pdF90
aGVybWFsX2NvbnRyb2xsZXIgLSBQcml2YXRlIEZ1bmN0aW9uIHVzZWQgZHVyaW5nIGluaXRpYWxp
emF0aW9uLgogICogSW5zcGVjdCB0aGUgUG93ZXJQbGF5IHRhYmxlIGZvciBvYnZpb3VzIHNpZ25z
IG9mIGNvcnJ1cHRpb24uCi0gKiBAcGFyYW0gaHdtZ3IgUG9pbnRlciB0byB0aGUgaGFyZHdhcmUg
bWFuYWdlci4KLSAqIEBwYXJhbSBwb3dlcnBsYXlfdGFibGUgUG9pbnRlciB0byB0aGUgUG93ZXJQ
bGF5IFRhYmxlLgotICogQGV4Y2VwdGlvbiBUaGlzIGltcGxlbWVudGF0aW9uIGFsd2F5cyByZXR1
cm5zIDEuCisgKiBAaHdtZ3I6IFBvaW50ZXIgdG8gdGhlIGhhcmR3YXJlIG1hbmFnZXIuCisgKiBA
cG93ZXJwbGF5X3RhYmxlOiBQb2ludGVyIHRvIHRoZSBQb3dlclBsYXkgVGFibGUuCisgKiBFeGNl
cHRpb246ICBUaGlzIGltcGxlbWVudGF0aW9uIGFsd2F5cyByZXR1cm5zIDEuCiAgKi8KIHN0YXRp
YyBpbnQgaW5pdF90aGVybWFsX2NvbnRyb2xsZXIoCiAJCXN0cnVjdCBwcF9od21nciAqaHdtZ3Is
CkBAIC0xMTA4LDExICsxMTA5LDExIEBAIHN0YXRpYyBpbnQgaW5pdF90aGVybWFsX2NvbnRyb2xs
ZXIoCiB9CiAKIC8qKgotICogUHJpdmF0ZSBGdW5jdGlvbiB1c2VkIGR1cmluZyBpbml0aWFsaXph
dGlvbi4KKyAqIGNoZWNrX3Bvd2VycGxheV90YWJsZXMgLSBQcml2YXRlIEZ1bmN0aW9uIHVzZWQg
ZHVyaW5nIGluaXRpYWxpemF0aW9uLgogICogSW5zcGVjdCB0aGUgUG93ZXJQbGF5IHRhYmxlIGZv
ciBvYnZpb3VzIHNpZ25zIG9mIGNvcnJ1cHRpb24uCi0gKiBAcGFyYW0gaHdtZ3IgUG9pbnRlciB0
byB0aGUgaGFyZHdhcmUgbWFuYWdlci4KLSAqIEBwYXJhbSBwb3dlcnBsYXlfdGFibGUgUG9pbnRl
ciB0byB0aGUgUG93ZXJQbGF5IFRhYmxlLgotICogQGV4Y2VwdGlvbiAyIGlmIHRoZSBwb3dlcnBs
YXkgdGFibGUgaXMgaW5jb3JyZWN0LgorICogQGh3bWdyOiBQb2ludGVyIHRvIHRoZSBoYXJkd2Fy
ZSBtYW5hZ2VyLgorICogQHBvd2VycGxheV90YWJsZTogUG9pbnRlciB0byB0aGUgUG93ZXJQbGF5
IFRhYmxlLgorICogRXhjZXB0aW9uOiAgMiBpZiB0aGUgcG93ZXJwbGF5IHRhYmxlIGlzIGluY29y
cmVjdC4KICAqLwogc3RhdGljIGludCBjaGVja19wb3dlcnBsYXlfdGFibGVzKAogCQlzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyLApAQCAtMTI1NSw5ICsxMjU2LDkgQEAgaW50IGdldF9udW1iZXJfb2Zf
cG93ZXJwbGF5X3RhYmxlX2VudHJpZXNfdjFfMChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCXJl
dHVybiAodWludDMyX3QpKHN0YXRlX2FycmF5cy0+dWNOdW1FbnRyaWVzKTsKIH0KIAotLyoqCi0q
IFByaXZhdGUgZnVuY3Rpb24gdG8gY29udmVydCBmbGFncyBzdG9yZWQgaW4gdGhlIEJJT1MgdG8g
c29mdHdhcmUgZmxhZ3MgaW4gUG93ZXJQbGF5LgotKi8KKy8qCisgKiBQcml2YXRlIGZ1bmN0aW9u
IHRvIGNvbnZlcnQgZmxhZ3Mgc3RvcmVkIGluIHRoZSBCSU9TIHRvIHNvZnR3YXJlIGZsYWdzIGlu
IFBvd2VyUGxheS4KKyAqLwogc3RhdGljIHVpbnQzMl90IG1ha2VfY2xhc3NpZmljYXRpb25fZmxh
Z3Moc3RydWN0IHBwX2h3bWdyICpod21nciwKIAkJdWludDE2X3QgY2xhc3NpZmljYXRpb24sIHVp
bnQxNl90IGNsYXNzaWZpY2F0aW9uMikKIHsKQEAgLTEzNTYsMTMgKzEzNTcsMTMgQEAgc3RhdGlj
IGludCBwcHRfZ2V0X3ZjZV9zdGF0ZV90YWJsZV9lbnRyeV92MV8wKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IsIHVpbnQzMl90IGkKIH0KIAogLyoqCi0qIENyZWF0ZSBhIFBvd2VyIFN0YXRlIG91dCBv
ZiBhbiBlbnRyeSBpbiB0aGUgUG93ZXJQbGF5IHRhYmxlLgotKiBUaGlzIGZ1bmN0aW9uIGlzIGNh
bGxlZCBieSB0aGUgaGFyZHdhcmUgYmFjay1lbmQuCi0qIEBwYXJhbSBod21nciBQb2ludGVyIHRv
IHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgotKiBAcGFyYW0gZW50cnlfaW5kZXggVGhlIGluZGV4IG9m
IHRoZSBlbnRyeSB0byBiZSBleHRyYWN0ZWQgZnJvbSB0aGUgdGFibGUuCi0qIEBwYXJhbSBwb3dl
cl9zdGF0ZSBUaGUgYWRkcmVzcyBvZiB0aGUgUG93ZXJTdGF0ZSBpbnN0YW5jZSBiZWluZyBjcmVh
dGVkLgotKiBAcmV0dXJuIC0xIGlmIHRoZSBlbnRyeSBjYW5ub3QgYmUgcmV0cmlldmVkLgotKi8K
KyAqIGdldF9wb3dlcnBsYXlfdGFibGVfZW50cnlfdjFfMCAtIENyZWF0ZSBhIFBvd2VyIFN0YXRl
IG91dCBvZiBhbiBlbnRyeSBpbiB0aGUgUG93ZXJQbGF5IHRhYmxlLgorICogVGhpcyBmdW5jdGlv
biBpcyBjYWxsZWQgYnkgdGhlIGhhcmR3YXJlIGJhY2stZW5kLgorICogQGh3bWdyOiBQb2ludGVy
IHRvIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgorICogQGVudHJ5X2luZGV4OiBUaGUgaW5kZXggb2Yg
dGhlIGVudHJ5IHRvIGJlIGV4dHJhY3RlZCBmcm9tIHRoZSB0YWJsZS4KKyAqIEBwb3dlcl9zdGF0
ZTogVGhlIGFkZHJlc3Mgb2YgdGhlIFBvd2VyU3RhdGUgaW5zdGFuY2UgYmVpbmcgY3JlYXRlZC4K
KyAqIFJldHVybjogLTEgaWYgdGhlIGVudHJ5IGNhbm5vdCBiZSByZXRyaWV2ZWQuCisgKi8KIGlu
dCBnZXRfcG93ZXJwbGF5X3RhYmxlX2VudHJ5X3YxXzAoc3RydWN0IHBwX2h3bWdyICpod21nciwK
IAkJdWludDMyX3QgZW50cnlfaW5kZXgsIHN0cnVjdCBwcF9wb3dlcl9zdGF0ZSAqcG93ZXJfc3Rh
dGUsCiAJCWludCAoKmNhbGxfYmFja19mdW5jKShzdHJ1Y3QgcHBfaHdtZ3IgKiwgdm9pZCAqLAot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
