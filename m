Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB34906C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321AE89D4B;
	Mon, 17 Jun 2019 19:50:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5479089FEC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:31 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p144so6966980qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RlOlSekkuEHNybcGlxWQ+MMRZZgo1AR1crLvN4RGeKg=;
 b=jRwTauuRy1ucBC6iMh1aXRmZm2+Tbo+VAGV6RfR/ONY/aw7kDjTbqpxkpxu9mvtpD6
 b4MIOBBwFMD84BCqNPnQH2oHwx1By7zf1REGS8mTPRAKkNDkOV1Zvyv2ATMkJ0JChQ06
 PeW5rHEqhxFH/5gAYj8LLdgo1gw/11wuj7SCSuCp5ENBu4scV0n0lcwMeKBXD6bjDFJq
 jcoY7LpgyAG0/O8S6XH+87L1lWkDNsHphRrYhhPJSsJmVlzBvdTAbxIZ18jWqKCcN1wk
 fceqt78lCoIAjgk+Kixwr5IvvHeOEVWiyrVWJF8Izsen7faYo7Ap51Rmn4ILy3iDnOQA
 du+w==
X-Gm-Message-State: APjAAAXvGbpCKnTfJOpco8rISPCsd8IyM1AOJf+I2bGfvi4lJ5TY7Xgy
 eDXJYAz/cBvwcuh5jyZLONO6ICK1Dyi5TQ==
X-Google-Smtp-Source: APXvYqzOdOPLQcfuUYLjGnS24jucI2qOPSTwQ7PdSeAblMCs4rqRVGVdT3+ynQ0XMMnYIYPScH4iWw==
X-Received: by 2002:a05:620a:55d:: with SMTP id
 o29mr89688168qko.287.1560801029512; 
 Mon, 17 Jun 2019 12:50:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 433/459] drm/amd/display: Return UPDATE_TYPE_FULL on writeback
 update
Date: Mon, 17 Jun 2019 14:49:22 -0500
Message-Id: <20190617194948.18667-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RlOlSekkuEHNybcGlxWQ+MMRZZgo1AR1crLvN4RGeKg=;
 b=iE1Ef6IcttQSSOvphxE7BMcZWJOUdfUYsudskhRA2q21egPfFrz4/guwA/E1mMgLyH
 f0zq23/TgIW/aURLkGcBral4wrhxmoYOVbWvMnldADgnnm++uiVGfXkmPK9gaVaLWmY/
 g7CGzEAd1NEloVWoQX4/PeJCP0JGnydGYgPnVMjAkJd+3xXcYvVKbvOX8XEP12aKFDjZ
 6yxyOVbu62SvTkVn/4MeeUFC5VjbcDGZfzVFHcV/4sU/piiBAfEWRz1rVC2nfeoqUchQ
 I5c8ei40d/huikILZai38RQVCioyFFAej+aZN2FckAHsNwEUIcLlarkOvau3KgI+m2lt
 pizQ==
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Duke Du <Duke.Du@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KClNob3VsZCBkbyBmdWxs
IHVwZGF0ZSB3aGVuIGRpc3BsYXkgd3JpdGViYWNrIGlzIHVwZGF0ZWQuCgpTaWduZWQtb2ZmLWJ5
OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRHVrZSBE
dSA8RHVrZS5EdUBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jICAgICAgICB8IDUg
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jIHwg
NCArKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2R3Yi5oICAgICB8
IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCBmZDk1NTE1MTEzMmYu
LjhjZWNkNTg2NTNjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
CkBAIC0xNTE2LDYgKzE1MTYsMTEgQEAgc3RhdGljIGVudW0gc3VyZmFjZV91cGRhdGVfdHlwZSBj
aGVja191cGRhdGVfc3VyZmFjZXNfZm9yX3N0cmVhbSgKIAogCQlpZiAoc3RyZWFtX3VwZGF0ZS0+
ZHBtc19vZmYpCiAJCQlyZXR1cm4gVVBEQVRFX1RZUEVfRlVMTDsKKworI2lmIGRlZmluZWQoQ09O
RklHX0RSTV9BTURfRENfRENOMl8wKQorCQlpZiAoc3RyZWFtX3VwZGF0ZS0+d2JfdXBkYXRlKQor
CQkJcmV0dXJuIFVQREFURV9UWVBFX0ZVTEw7CisjZW5kaWYKIAl9CiAKIAlmb3IgKGkgPSAwIDsg
aSA8IHN1cmZhY2VfY291bnQ7IGkrKykgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19zdHJlYW0uYwppbmRleCAzNzg3Mzk4ZjZkODAuLjMwYTI1ZTY5NGRhMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMK
QEAgLTM3Myw2ICszNzMsNyBAQCBib29sIGRjX3N0cmVhbV9hZGRfd3JpdGViYWNrKHN0cnVjdCBk
YyAqZGMsCiB7CiAJYm9vbCBpc0RyYyA9IGZhbHNlOwogCWludCBpID0gMDsKKwlzdHJ1Y3QgZHdi
YyAqZHdiOwogCiAJaWYgKHN0cmVhbSA9PSBOVUxMKSB7CiAJCWRtX2Vycm9yKCJEQzogZGNfc3Ry
ZWFtIGlzIE5VTEwhXG4iKTsKQEAgLTM5MSw3ICszOTIsOCBAQCBib29sIGRjX3N0cmVhbV9hZGRf
d3JpdGViYWNrKHN0cnVjdCBkYyAqZGMsCiAKIAl3Yl9pbmZvLT5kd2JfcGFyYW1zLm91dF90cmFu
c2Zlcl9mdW5jID0gc3RyZWFtLT5vdXRfdHJhbnNmZXJfZnVuYzsKIAotCisJZHdiID0gZGMtPnJl
c19wb29sLT5kd2JjW3diX2luZm8tPmR3Yl9waXBlX2luc3RdOworCWR3Yi0+ZHdiX2lzX2RyYyA9
IGZhbHNlOwogCiAJLyogcmVjYWxjdWxhdGUgYW5kIGFwcGx5IERNTCBwYXJhbWV0ZXJzICovCiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZHdiLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2R3Yi5oCmluZGV4IGQ0YWU2
ZWFhZWI1Ny4uMGFjMjFmYTIzMWM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvaW5jL2h3L2R3Yi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHcvZHdiLmgKQEAgLTEyNyw2ICsxMjcsNyBAQCBzdHJ1Y3QgZHdiYyB7CiAJZW51bSBk
Y190cmFuc2Zlcl9mdW5jX3ByZWRlZmluZWQgdGY7CiAJZW51bSBkY19jb2xvcl9zcGFjZSBvdXRw
dXRfY29sb3Jfc3BhY2U7CiAJYm9vbCBkd2JfaXNfZWZjX3RyYW5zaXRpb247CisJYm9vbCBkd2Jf
aXNfZHJjOwogCWludCB3Yl9zcmNfcGxhbmVfaW5zdDsvKmh1YnAsIG1wY2MsIGluc3QqLwogCWJv
b2wgdXBkYXRlX3ByaXZhY3ltYXNrOwogCXVpbnQzMl90IG1hc2tfaWQ7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
