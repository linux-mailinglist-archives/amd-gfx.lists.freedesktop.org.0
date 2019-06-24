Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B35101D
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5228889C3B;
	Mon, 24 Jun 2019 15:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B0289C3B
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:15:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m23so12944841lje.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q88Qbezg0pbysXUqoep1s11N7eOBCG1Wk4T8sYkwHd0=;
 b=bjPmMsmeSKkeEOH9GtXnXjulxPpxXxA8/YWHBhuXb9QWdGdcXGiWeY7X39XQOE411Q
 Ug/aEiqYHYm7pN6pydKhk2C44//BDk3YJXxxdGrC/XhuA1yWCrFn8rVPBSA37wH08b5s
 ZKimFdz/+rWddWayrSGQoiXNocJCxO65TBnHqxAHfr7YbacbA+kWyLlzIhWmCqipCYTG
 Zqlad9emgRXatBdcQWAPEsnzjFt5gDqqCtORlUnUUmith/0uiGjToRQBvnT+kkto/m+w
 Z4osPNveOpc3JDPhEWdkifcCnskDZOooRW81RHMwqE7LCaghBW7oYwQJWUOQrEh1erLB
 sOqQ==
X-Gm-Message-State: APjAAAXR3TyhefeCtNWF3ope3BdgsQoC0PvBHDwuJTdxaDlBOTaVW1ag
 wunCwosbXZBKaFAOd2gKX1kX3MmmYZY=
X-Google-Smtp-Source: APXvYqxObm7eSgMpjOvm9wVBLlESklB8xg8jOorf1ehQ4rMAw/VEtNQa6Dcdc4VFYdVl4nK5MdhrZA==
X-Received: by 2002:a2e:8495:: with SMTP id b21mr17734634ljh.149.1561389355809; 
 Mon, 24 Jun 2019 08:15:55 -0700 (PDT)
Received: from localhost.localdomain ([188.151.232.219])
 by smtp.googlemail.com with ESMTPSA id u18sm1797201ljj.32.2019.06.24.08.15.54
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 08:15:55 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amd/amdgpu: Check stream in amdgpu_dm_commit_planes
Date: Mon, 24 Jun 2019 17:15:42 +0200
Message-Id: <20190624151544.13934-4-ernstp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624151544.13934-1-ernstp@gmail.com>
References: <20190624151544.13934-1-ernstp@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q88Qbezg0pbysXUqoep1s11N7eOBCG1Wk4T8sYkwHd0=;
 b=V9H5CSPpHCWwm2A4NfvZZcOyEo7nK2W23LYlMyCdIMgURNcbMwoh911O8l+ozT7GO/
 eNgyZw1cbLD8z/qqC00zR4jXhwIyUwZuhFGvvn0n2WGaT+J1Ke6AsGRVqk1zTtajFyZU
 HquWPLxQmixQq5JZ+4MzPZ4sO7yIqDmbfzJo3iKNC3Mqn23KKJ73E86cWPjgKPG015J2
 AV/pJh7ar0tyOavYHgkGiTWDLas4FrzLp1fAo3V64lhqZJIynNR1/uSFvgfedYNR42pW
 gr32diTKIMKbXtskrYUa/qOKPx/rDLck/JaHN+SDIuoGxjO+rNW5pO+MgRXeh8yX/ryi
 kh7w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVwb3J0ZWQgYnkgc21hdGNoOgphbWRncHVfZG0uYzo1NjM3IGFtZGdwdV9kbV9jb21taXRfcGxh
bmVzKCkgZXJyb3I6IHdlIHByZXZpb3VzbHkgYXNzdW1lZCAnYWNydGNfc3RhdGUtPnN0cmVhbScg
Y291bGQgYmUgbnVsbApUaGlzIHNlZW1zIHRvIGJlIGNoZWNrZWQgZm9yIG51bGwgcHJldHR5IGNv
bnNpc3RlbnRseSBlbHNld2hlcmUuCgpTaWduZWQtb2ZmLWJ5OiBFcm5zdCBTasO2c3RyYW5kIDxl
cm5zdHBAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCmluZGV4IDU4ZDdiYmM1YWRhNy4uMzYwYjMxYTVjMDI4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAg
LTU2NjksNyArNTY2OSw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21taXRfcGxhbmVzKHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAl9CiAKIAkvKiBVcGRhdGUgdGhlIHBsYW5l
cyBpZiBjaGFuZ2VkIG9yIGRpc2FibGUgaWYgd2UgZG9uJ3QgaGF2ZSBhbnkuICovCi0JaWYgKHBs
YW5lc19jb3VudCB8fCBhY3J0Y19zdGF0ZS0+YWN0aXZlX3BsYW5lcyA9PSAwKSB7CisJaWYgKChw
bGFuZXNfY291bnQgfHwgYWNydGNfc3RhdGUtPmFjdGl2ZV9wbGFuZXMgPT0gMCkgJiYKKwkJYWNy
dGNfc3RhdGUtPnN0cmVhbSkgewogCQlpZiAobmV3X3BjcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQp
IHsKIAkJCWJ1bmRsZS0+c3RyZWFtX3VwZGF0ZS5zcmMgPSBhY3J0Y19zdGF0ZS0+c3RyZWFtLT5z
cmM7CiAJCQlidW5kbGUtPnN0cmVhbV91cGRhdGUuZHN0ID0gYWNydGNfc3RhdGUtPnN0cmVhbS0+
ZHN0OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
