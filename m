Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9A2C0C47
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 14:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B2589E1B;
	Mon, 23 Nov 2020 13:58:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDB389A94
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x13so7470914wmj.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q9nOuAyNuSnMvxG/2OuToweTEm0XWfNfEAno5/MOVLo=;
 b=xSR30k//SbK/enLO3H8pSlIZr+qDnzQ4F182rUTLcw60ffjqKJ6/b+s0Q9PnW3SYXp
 rcrwgNOW5QOKlBuRXUpBxmyYyIrkhr/rbJyigkVt+P7QphFULKRVhNaIu9czDJv5KROf
 p0JjkrmLIAkXOFeIomlmVrCUR6DbjDeVrCla2G2wEdTqWlrh3QkuJu+tjetZXsybVkxP
 OwD16s+yjEazWU7hgyhq1XqTwLKlNdTpvZYQJ2BVPTBABuNwDWNDgKeCJ2xwudYLvUQg
 dDp70KjdGfIIVFJSuyv6TXu4MFfJlITpN06KDk5JzmYYBUAO7m1iKAwH2MQoDA9nE2SE
 mN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q9nOuAyNuSnMvxG/2OuToweTEm0XWfNfEAno5/MOVLo=;
 b=UOiSzfKCd6ke4C3dJyYgFZo0CRQRiPH5kJs5NlVyqKe/cj3UQPfYSj44AdFZnVKKRR
 TuDlLnbwWI8ZXgDfE65NyIrXkEFXVrhyoHr1lh73BQg0QqA2Mn0SkjrICVOIT/5jAh60
 snNFd5tWfUfh1r8e/SelZ2ZnWle0cTkPMR+09oFGiUNGwXOvGgbTOhHnPzosArEULPkU
 OAtnuG/8PL4y6hnB68I7GiMC79GbNypXVMNXymSi8/rtBJXnPU/32/Kljnvt41XtN1YF
 W3ttYlNKp67ELs0ENA+7VqjKfd6ACmFWP4N2JBBPqHuz/yk+jPk++tVSibX0FLpbSqkp
 oyDg==
X-Gm-Message-State: AOAM531dAuBtfD1FbQreaSY9vnhiW2pJOJNRNqCxn+EJoEz7g16BITap
 8kwNM1udYjwfAEtCVlFst4eKxw==
X-Google-Smtp-Source: ABdhPJxUpRdYurIcVkn8Ye5orOlel09O+wUB5od5cshSiFGQNoDMp700kYFgoQ8ZFbeS4FAuWafhxg==
X-Received: by 2002:a1c:f612:: with SMTP id w18mr23805537wmc.11.1606130383174; 
 Mon, 23 Nov 2020 03:19:43 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/amd/amdgpu/si_dma: Fix a bunch of function
 documentation issues
Date: Mon, 23 Nov 2020 11:18:55 +0000
Message-Id: <20201123111919.233376-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 13:58:01 +0000
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmM6OTI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ2FkZHInIG5vdCBkZXNjcmliZWQgaW4gJ3NpX2RtYV9yaW5nX2VtaXRf
ZmVuY2UnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEuYzo5Mjogd2FybmluZzog
RnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc2VxJyBub3QgZGVzY3JpYmVkIGluICdzaV9k
bWFfcmluZ19lbWl0X2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmM6
OTI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVz
Y3JpYmVkIGluICdzaV9kbWFfcmluZ19lbWl0X2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2lfZG1hLmM6OTI6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2Zl
bmNlJyBkZXNjcmlwdGlvbiBpbiAnc2lfZG1hX3JpbmdfZW1pdF9mZW5jZScKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NpX2RtYS5jOjI1Mjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAndGltZW91dCcgbm90IGRlc2NyaWJlZCBpbiAnc2lfZG1hX3JpbmdfdGVzdF9p
YicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpX2RtYS5jOjQwODogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmluZycgbm90IGRlc2NyaWJlZCBpbiAnc2lfZG1h
X3JpbmdfcGFkX2liJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmM6NDQ2OiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd2bWlkJyBub3QgZGVzY3JpYmVk
IGluICdzaV9kbWFfcmluZ19lbWl0X3ZtX2ZsdXNoJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2lfZG1hLmM6NDQ2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdw
ZF9hZGRyJyBub3QgZGVzY3JpYmVkIGluICdzaV9kbWFfcmluZ19lbWl0X3ZtX2ZsdXNoJwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmM6NDQ2OiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24gcGFyYW1ldGVyICd2bScgZGVzY3JpcHRpb24gaW4gJ3NpX2RtYV9yaW5nX2VtaXRfdm1f
Zmx1c2gnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEuYzo3ODE6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2liJyBub3QgZGVzY3JpYmVkIGluICdzaV9k
bWFfZW1pdF9jb3B5X2J1ZmZlcicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpX2RtYS5j
Ojc4MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndG16JyBub3QgZGVz
Y3JpYmVkIGluICdzaV9kbWFfZW1pdF9jb3B5X2J1ZmZlcicKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NpX2RtYS5jOjc4MTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAn
cmluZycgZGVzY3JpcHRpb24gaW4gJ3NpX2RtYV9lbWl0X2NvcHlfYnVmZmVyJwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmM6ODA0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdpYicgbm90IGRlc2NyaWJlZCBpbiAnc2lfZG1hX2VtaXRfZmlsbF9idWZm
ZXInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEuYzo4MDQ6IHdhcm5pbmc6IEV4
Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3JpbmcnIGRlc2NyaXB0aW9uIGluICdzaV9kbWFfZW1p
dF9maWxsX2J1ZmZlcicKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0t
c2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEuYyB8IDE0
ICsrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpX2RtYS5jCmluZGV4IDdkMmJiY2JlNTQ3
YjIuLjU0MGRjZWQxOTBmMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NpX2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpX2RtYS5jCkBAIC04
MSw3ICs4MSw5IEBAIHN0YXRpYyB2b2lkIHNpX2RtYV9yaW5nX2VtaXRfaWIoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLAogICogc2lfZG1hX3JpbmdfZW1pdF9mZW5jZSAtIGVtaXQgYSBmZW5jZSBv
biB0aGUgRE1BIHJpbmcKICAqCiAgKiBAcmluZzogYW1kZ3B1IHJpbmcgcG9pbnRlcgotICogQGZl
bmNlOiBhbWRncHUgZmVuY2Ugb2JqZWN0CisgKiBAYWRkcjogYWRkcmVzcworICogQHNlcTogc2Vx
dWVuY2UgbnVtYmVyCisgKiBAZmxhZ3M6IGZlbmNlIHJlbGF0ZWQgZmxhZ3MKICAqCiAgKiBBZGQg
YSBETUEgZmVuY2UgcGFja2V0IHRvIHRoZSByaW5nIHRvIHdyaXRlCiAgKiB0aGUgZmVuY2Ugc2Vx
IG51bWJlciBhbmQgRE1BIHRyYXAgcGFja2V0IHRvIGdlbmVyYXRlCkBAIC0yNDQsNiArMjQ2LDcg
QEAgc3RhdGljIGludCBzaV9kbWFfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nKQogICogc2lfZG1hX3JpbmdfdGVzdF9pYiAtIHRlc3QgYW4gSUIgb24gdGhlIERNQSBlbmdp
bmUKICAqCiAgKiBAcmluZzogYW1kZ3B1X3Jpbmcgc3RydWN0dXJlIGhvbGRpbmcgcmluZyBpbmZv
cm1hdGlvbgorICogQHRpbWVvdXQ6IHRpbWVvdXQgdmFsdWUgaW4gamlmZmllcywgb3IgTUFYX1ND
SEVEVUxFX1RJTUVPVVQKICAqCiAgKiBUZXN0IGEgc2ltcGxlIElCIGluIHRoZSBETUEgcmluZyAo
VkkpLgogICogUmV0dXJucyAwIG9uIHN1Y2Nlc3MsIGVycm9yIG9uIGZhaWx1cmUuCkBAIC00MDEs
NiArNDA0LDcgQEAgc3RhdGljIHZvaWQgc2lfZG1hX3ZtX3NldF9wdGVfcGRlKHN0cnVjdCBhbWRn
cHVfaWIgKmliLAogLyoqCiAgKiBzaV9kbWFfcGFkX2liIC0gcGFkIHRoZSBJQiB0byB0aGUgcmVx
dWlyZWQgbnVtYmVyIG9mIGR3CiAgKgorICogQHJpbmc6IGFtZGdwdV9yaW5nIHBvaW50ZXIKICAq
IEBpYjogaW5kaXJlY3QgYnVmZmVyIHRvIGZpbGwgd2l0aCBwYWRkaW5nCiAgKgogICovCkBAIC00
MzYsNyArNDQwLDggQEAgc3RhdGljIHZvaWQgc2lfZG1hX3JpbmdfZW1pdF9waXBlbGluZV9zeW5j
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKICAqIHNpX2RtYV9yaW5nX2VtaXRfdm1fZmx1c2gg
LSBjaWsgdm0gZmx1c2ggdXNpbmcgc0RNQQogICoKICAqIEByaW5nOiBhbWRncHVfcmluZyBwb2lu
dGVyCi0gKiBAdm06IGFtZGdwdV92bSBwb2ludGVyCisgKiBAdm1pZDogdm1pZCBudW1iZXIgdG8g
dXNlCisgKiBAcGRfYWRkcjogYWRkcmVzcwogICoKICAqIFVwZGF0ZSB0aGUgcGFnZSB0YWJsZSBi
YXNlIGFuZCBmbHVzaCB0aGUgVk0gVExCCiAgKiB1c2luZyBzRE1BIChWSSkuCkBAIC03NjQsMTAg
Kzc2OSwxMSBAQCBzdGF0aWMgdm9pZCBzaV9kbWFfc2V0X2lycV9mdW5jcyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIC8qKgogICogc2lfZG1hX2VtaXRfY29weV9idWZmZXIgLSBjb3B5IGJ1
ZmZlciB1c2luZyB0aGUgc0RNQSBlbmdpbmUKICAqCi0gKiBAcmluZzogYW1kZ3B1X3Jpbmcgc3Ry
dWN0dXJlIGhvbGRpbmcgcmluZyBpbmZvcm1hdGlvbgorICogQGliOiBpbmRpcmVjdCBidWZmZXIg
dG8gY29weSB0bwogICogQHNyY19vZmZzZXQ6IHNyYyBHUFUgYWRkcmVzcwogICogQGRzdF9vZmZz
ZXQ6IGRzdCBHUFUgYWRkcmVzcwogICogQGJ5dGVfY291bnQ6IG51bWJlciBvZiBieXRlcyB0byB4
ZmVyCisgKiBAdG16OiB1bnVzZWQKICAqCiAgKiBDb3B5IEdQVSBidWZmZXJzIHVzaW5nIHRoZSBE
TUEgZW5naW5lIChWSSkuCiAgKiBVc2VkIGJ5IHRoZSBhbWRncHUgdHRtIGltcGxlbWVudGF0aW9u
IHRvIG1vdmUgcGFnZXMgaWYKQEAgLTc5MCw3ICs3OTYsNyBAQCBzdGF0aWMgdm9pZCBzaV9kbWFf
ZW1pdF9jb3B5X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X2liICppYiwKIC8qKgogICogc2lfZG1hX2Vt
aXRfZmlsbF9idWZmZXIgLSBmaWxsIGJ1ZmZlciB1c2luZyB0aGUgc0RNQSBlbmdpbmUKICAqCi0g
KiBAcmluZzogYW1kZ3B1X3Jpbmcgc3RydWN0dXJlIGhvbGRpbmcgcmluZyBpbmZvcm1hdGlvbgor
ICogQGliOiBpbmRpcmVjdCBidWZmZXIgdG8gY29weSB0bwogICogQHNyY19kYXRhOiB2YWx1ZSB0
byB3cml0ZSB0byBidWZmZXIKICAqIEBkc3Rfb2Zmc2V0OiBkc3QgR1BVIGFkZHJlc3MKICAqIEBi
eXRlX2NvdW50OiBudW1iZXIgb2YgYnl0ZXMgdG8geGZlcgotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
