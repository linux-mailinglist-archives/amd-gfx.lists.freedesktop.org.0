Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0656A044
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CED889F33;
	Tue, 16 Jul 2019 01:28:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B451E89F33
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:28:00 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id l9so17775487qtu.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lG9gAImy6eg/O8Mtx+AhO6uyM1afQv74y78cOtH/U0=;
 b=esfTTNKvJ1+0x3AMDmGzSBdyn75/6aQXEU7Q0TT6TpRZcSj5ARQ+8onZj3Q72ay8Ko
 hkAhdLmog9kAh7c4tof626OmLhI32gCwxFrH6PPfWTqpMageaWxhRwBzgzeBtXeFdUs5
 q88C0uTSMVxtjvw5h7nz2+EmAz0rOQmDO5w6pQzbgfhwuZr25PlbdH/hwkT4MJbkaa96
 QOw5q7hPiR1LKbyntawEYVka0HwGB+8IOnXR0RWzBQZ0dnX097XLBgT2wUdf6YcKoy/H
 0aOdAQsWq6a/9DLFWjRY7/3s3mUgh/LQak4UCMvIjQ/tP9EyqZ3E3mils92JuzHvINm3
 6QoA==
X-Gm-Message-State: APjAAAUrE4Eci5pzwW09CB67yxySAGEQDbQzbGkY70QVj5Zrzolv/8Xx
 x03RYWM+DHz/9CR7uqG7x9fbxj2B
X-Google-Smtp-Source: APXvYqzY5JL6u0xRlyvN7TNG1fTtOHRYlX9rm55/6z7Q1rX7iVstMkhDj8XlqMFCB2Wx4zPAHc2M9w==
X-Received: by 2002:ac8:670f:: with SMTP id e15mr19757940qtp.191.1563240479539; 
 Mon, 15 Jul 2019 18:27:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 102/102] drm/amdgpu: flag arcturus as experimental for now
Date: Mon, 15 Jul 2019 20:27:41 -0500
Message-Id: <20190716012741.32036-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lG9gAImy6eg/O8Mtx+AhO6uyM1afQv74y78cOtH/U0=;
 b=XARldprqUCiZgEwcmRwqtH9Z1tsFbDipY1K2kor7RH+H8nM0zcsTQBqHTTfv69xn3z
 cM0Z1dX7Lixcj3yAVVc9qKzKM+P7ig3Zw4VBeLl4eQdAwsud1DRZsr/KKLu5cszBRhG3
 aPYVzXDnIMN446C3Gd/EXOAlRzzr3BnlUO9shh/OsTujkrUVsmr0bwbU4whFUY4cK2dM
 xrsgkaWkxWWiF3/zJoNxeUWjdIknY9hACCGZfpl9f/2foh9zNuE8zuZWHejoYyGcOpIL
 0cgnzSiICYTZwRNMK0gGHc85pQ0klOQgamxEBiEdcqbQiZMMqv498zs1o9MSqkBl2LVi
 +GHw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q3VycmVudCBzdXBwb3J0IHdpbGwgb25seSB3b3JrIGluIGludGVybmFsIGVuZ2luZWVyaW5nCmJv
YXJkcy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggZmM4ZjgyYWMxMzgyLi45
MGI4NGQyMjY1ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAg
LTk5NSw5ICs5OTUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRs
aXN0W10gPSB7CiAJezB4MTAwMiwgMHgxNWRkLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAw
LCBDSElQX1JBVkVOfEFNRF9JU19BUFV9LAogCXsweDEwMDIsIDB4MTVkOCwgUENJX0FOWV9JRCwg
UENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9SQVZFTnxBTURfSVNfQVBVfSwKIAkvKiBBcmN0dXJ1cyAq
LwotCXsweDEwMDIsIDB4NzM4QywgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9B
UkNUVVJVU30sCi0JezB4MTAwMiwgMHg3Mzg4LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAw
LCBDSElQX0FSQ1RVUlVTfSwKLQl7MHgxMDAyLCAweDczOEUsIFBDSV9BTllfSUQsIFBDSV9BTllf
SUQsIDAsIDAsIENISVBfQVJDVFVSVVN9LAorCXsweDEwMDIsIDB4NzM4QywgUENJX0FOWV9JRCwg
UENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9BUkNUVVJVU3xBTURfRVhQX0hXX1NVUFBPUlR9LAorCXsw
eDEwMDIsIDB4NzM4OCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9BUkNUVVJV
U3xBTURfRVhQX0hXX1NVUFBPUlR9LAorCXsweDEwMDIsIDB4NzM4RSwgUENJX0FOWV9JRCwgUENJ
X0FOWV9JRCwgMCwgMCwgQ0hJUF9BUkNUVVJVU3xBTURfRVhQX0hXX1NVUFBPUlR9LAogCS8qIE5h
dmkxMCAqLwogCXsweDEwMDIsIDB4NzMxMCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwg
Q0hJUF9OQVZJMTB9LAogCXsweDEwMDIsIDB4NzMxMiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwg
MCwgMCwgQ0hJUF9OQVZJMTB9LAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
