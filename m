Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C4378FCD
	for <lists+amd-gfx@lfdr.de>; Mon, 10 May 2021 15:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8D56E48C;
	Mon, 10 May 2021 13:57:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056BA6E059;
 Mon, 10 May 2021 10:37:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AA6961943;
 Mon, 10 May 2021 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620643030;
 bh=9IKPaB906Djut97p5MwTWhhrS8i29IzcBxZyrY37QIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yNxn1iK+I1FehDzmOLQF9r0FX9oLtfw+XE0KEKNNnPlH1unpF/OaaeiTwIQp+Z+n0
 87ADYXKTK+NaepT6rolIHAfhHQe+pAYkPfeaZqdNYW5pXXldMo7R0yCUWBUXyahXYI
 5naCYs1MpreXb/+TBdM56bloRkYNsAsQy1ZhVQqo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 122/299] drm/amd/display/dc/dce/dce_aux: Remove duplicate
 line causing field overwritten issue
Date: Mon, 10 May 2021 12:18:39 +0200
Message-Id: <20210510102009.010406493@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510102004.821838356@linuxfoundation.org>
References: <20210510102004.821838356@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 10 May 2021 13:57:54 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KClsgVXBzdHJlYW0gY29tbWl0
IDg5YWRjMTAxNzhmZDZjYjY4YzhlZjE5MDVkMjY5MDcwYTRkM2JkNjQgXQoKRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTEx
Ml9yZXNvdXJjZS5jOjU5OgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9h
c2ljX3JlZy9kY2UvZGNlXzExXzJfc2hfbWFzay5oOjEwMDE0OjU4OiB3YXJuaW5nOiBpbml0aWFs
aXplZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdvdmVycmlkZS1pbml0XQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oOjIxNDoxNjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9TV19EQVRBX19BVVhfU1dfQVVUT0lOQ1JFTUVOVF9E
SVNBQkxFX19TSElGVOKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9k
Yy9kY2UvZGNlX2F1eC5oOjEyNzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQVVY
X1NG4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMi9k
Y2UxMTJfcmVzb3VyY2UuYzoxNzc6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERD
RV9BVVhfTUFTS19TSF9MSVNU4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9pbmNs
dWRlL2FzaWNfcmVnL2RjZS9kY2VfMTFfMl9zaF9tYXNrLmg6MTAwMTQ6NTg6IG5vdGU6IChuZWFy
IGluaXRpYWxpemF0aW9uIGZvciDigJhhdXhfc2hpZnQuQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElT
QUJMReKAmSkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9hdXguaDoyMTQ6MTY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhBVVhfU1dfREFU
QV9fQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMRV9fU0hJRlTigJkKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDoxMjc6Mjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9TRuKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmM6MTc3OjI6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhEQ0VfQVVYX01BU0tfU0hfTElTVOKAmQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzExXzJfc2hfbWFz
ay5oOjEwMDEzOjU2OiB3YXJuaW5nOiBpbml0aWFsaXplZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdv
dmVycmlkZS1pbml0XQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX2F1eC5oOjIxNDoxNjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9T
V19EQVRBX19BVVhfU1dfQVVUT0lOQ1JFTUVOVF9ESVNBQkxFX01BU0vigJkKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDoxMjc6Mjogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9TRuKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmM6MTgxOjI6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhEQ0VfQVVYX01BU0tfU0hfTElTVOKAmQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzExXzJfc2hf
bWFzay5oOjEwMDEzOjU2OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYYXV4X21h
c2suQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMReKAmSkKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDoyMTQ6MTY6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyDigJhBVVhfU1dfREFUQV9fQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJM
RV9NQVNL4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9k
Y2VfYXV4Lmg6MTI3OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhBVVhfU0bigJkK
CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2Vy
bmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXgu
aCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oCmluZGV4IDM4MjQ2NTg2MmYyOS4uZjcyZjAy
ZTAxNmFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9hdXguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXgu
aApAQCAtOTksNyArOTksNiBAQCBzdHJ1Y3QgZGNlMTEwX2F1eF9yZWdpc3RlcnMgewogCUFVWF9T
RihBVVhfU1dfQ09OVFJPTCwgQVVYX1NXX0dPLCBtYXNrX3NoKSxcCiAJQVVYX1NGKEFVWF9TV19E
QVRBLCBBVVhfU1dfQVVUT0lOQ1JFTUVOVF9ESVNBQkxFLCBtYXNrX3NoKSxcCiAJQVVYX1NGKEFV
WF9TV19EQVRBLCBBVVhfU1dfREFUQV9SVywgbWFza19zaCksXAotCUFVWF9TRihBVVhfU1dfREFU
QSwgQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMRSwgbWFza19zaCksXAogCUFVWF9TRihBVVhf
U1dfREFUQSwgQVVYX1NXX0lOREVYLCBtYXNrX3NoKSxcCiAJQVVYX1NGKEFVWF9TV19EQVRBLCBB
VVhfU1dfREFUQSwgbWFza19zaCksXAogCUFVWF9TRihBVVhfU1dfU1RBVFVTLCBBVVhfU1dfUkVQ
TFlfQllURV9DT1VOVCwgbWFza19zaCksXAotLSAKMi4zMC4yCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
