Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D53CB14E
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Jul 2021 06:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CD66E8EB;
	Fri, 16 Jul 2021 04:07:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3416E8AA
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Jul 2021 19:11:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0523161418;
 Thu, 15 Jul 2021 19:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626376271;
 bh=rhRpncM7YAEI4dDuqLn6BK0a0nui5MB+JeBm0/VH770=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zT5GnTMBlVEftOU+4pg4BeoshJn6sxQFpyNI2Dmq1aasZIeYEYTdF+w0jfXzV1EUK
 UHPwdmExcjFBi3PJjtuUxMqtE+R3g8wrXwc3B1bMzJGhHWoydgSAYHK+opIRYU8inR
 JV5X2YOw6++g0FgbuCbY+MVCUgX1hiftzwiG7fgc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.13 199/266] drm/amd/display: Reject non-zero src_y and src_x
 for video planes
Date: Thu, 15 Jul 2021 20:39:14 +0200
Message-Id: <20210715182645.487346639@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715182613.933608881@linuxfoundation.org>
References: <20210715182613.933608881@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 16 Jul 2021 04:07:08 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 danny.wang@amd.com, hersenxs.wu@amd.com, stable@vger.kernel.org,
 alexander.deucher@amd.com, Harry Wentland <harry.wentland@amd.com>,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cgpjb21taXQgYzZj
NmE3MTIxOTlhYjM1NWNlMzMzZmE1NzY0YTU5NTA2YmIxMDdjMSB1cHN0cmVhbS4KCltXaHldClRo
aXMgaGFzbid0IGJlZW4gd2VsbCB0ZXN0ZWQgYW5kIGxlYWRzIHRvIGNvbXBsZXRlIHN5c3RlbSBo
YW5ncyBvbiBEQ04xCmJhc2VkIHN5c3RlbXMsIHBvc3NpYmx5IG90aGVycy4KClRoZSBzeXN0ZW0g
aGFuZyBjYW4gYmUgcmVwcm9kdWNlZCBieSBnZXN0dXJpbmcgdGhlIHZpZGVvIG9uIHRoZSBZb3VU
dWJlCkFuZHJvaWQgYXBwIG9uIENocm9tZU9TIGludG8gZnVsbCBzY3JlZW4uCgpbSG93XQpSZWpl
Y3QgYXRvbWljIGNvbW1pdHMgd2l0aCBub24temVybyBkcm1fcGxhbmVfc3RhdGUuc3JjX3ggb3Ig
c3JjX3kgdmFsdWVzLgoKdjI6CiAtIEFkZCBjb2RlIGNvbW1lbnQgZGVzY3JpYmluZyB0aGUgcmVh
c29uIHdlJ3JlIHJlamVjdGluZyBub24temVybwogICBzcmNfeCBhbmQgc3JjX3kKIC0gRHJvcCBn
ZXJyaXQgQ2hhbmdlLUlkCiAtIEFkZCBzdGFibGUgQ0MKIC0gQmFzZWQgb24gYW1kLXN0YWdpbmct
ZHJtLW5leHQKCnYzOiByZW1vdmVkIHRyYWlsaW5nIHdoaXRlc3BhY2UKClNpZ25lZC1vZmYtYnk6
IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwpDYzogbmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tCkNjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogYWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbQpDYzogUm9t
YW4uTGlAYW1kLmNvbQpDYzogaGVyc2VueHMud3VAYW1kLmNvbQpDYzogZGFubnkud2FuZ0BhbWQu
Y29tClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2Fz
QGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIZXJzZW4gV3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4K
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8
ICAgMTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
CgotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
QEAgLTQwNDksNiArNDA0OSwyMyBAQCBzdGF0aWMgaW50IGZpbGxfZGNfc2NhbGluZ19pbmZvKGNv
bnN0IHN0CiAJICAgICBzY2FsaW5nX2luZm8tPnNyY19yZWN0LnkgIT0gMCkpCiAJCXJldHVybiAt
RUlOVkFMOwogCisJLyoKKwkgKiBGb3IgcmVhc29ucyB3ZSBkb24ndCAoeWV0KSBmdWxseSB1bmRl
cnN0YW5kIGEgbm9uLXplcm8KKwkgKiBzcmNfeSBjb29yZGluYXRlIGludG8gYW4gTlYxMiBidWZm
ZXIgY2FuIGNhdXNlIGEKKwkgKiBzeXN0ZW0gaGFuZy4gVG8gYXZvaWQgaGFuZ3MgKGFuZCBtYXli
ZSBiZSBvdmVybHkgY2F1dGlvdXMpCisJICogbGV0J3MgcmVqZWN0IGJvdGggbm9uLXplcm8gc3Jj
X3ggYW5kIHNyY195LgorCSAqCisJICogV2UgY3VycmVudGx5IGtub3cgb2Ygb25seSBvbmUgdXNl
LWNhc2UgdG8gcmVwcm9kdWNlIGEKKwkgKiBzY2VuYXJpbyB3aXRoIG5vbi16ZXJvIHNyY194IGFu
ZCBzcmNfeSBmb3IgTlYxMiwgd2hpY2gKKwkgKiBpcyB0byBnZXN0dXJlIHRoZSBZb3VUdWJlIEFu
ZHJvaWQgYXBwIGludG8gZnVsbCBzY3JlZW4KKwkgKiBvbiBDaHJvbWVPUy4KKwkgKi8KKwlpZiAo
c3RhdGUtPmZiICYmCisJICAgIHN0YXRlLT5mYi0+Zm9ybWF0LT5mb3JtYXQgPT0gRFJNX0ZPUk1B
VF9OVjEyICYmCisJICAgIChzY2FsaW5nX2luZm8tPnNyY19yZWN0LnggIT0gMCB8fAorCSAgICAg
c2NhbGluZ19pbmZvLT5zcmNfcmVjdC55ICE9IDApKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXNj
YWxpbmdfaW5mby0+c3JjX3JlY3Qud2lkdGggPSBzdGF0ZS0+c3JjX3cgPj4gMTY7CiAJaWYgKHNj
YWxpbmdfaW5mby0+c3JjX3JlY3Qud2lkdGggPT0gMCkKIAkJcmV0dXJuIC1FSU5WQUw7CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
