Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D118B83A4
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 23:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F286FBE8;
	Thu, 19 Sep 2019 21:45:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B7F6FBDC
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 21:45:40 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id u40so6172738qth.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAVHrZSFAZjqZ0zzrbJu8XAHHCqwsOBXIzePmdlkEYY=;
 b=myT32OJTjzIgD4fnuNb9HKpnlN+geXnDELHtSX+SaaTRZyIQZqGKGgMd/pzGjzRPjo
 yxsxooPKSt76YoMotxGoymvklIsPQY8WFFeyTdKu0hhaMaxdvt44FnlXQMJMlcCq93Yy
 xogAf771xjExKCqcNzwaqD2yzoXw8ovqhLxhiRfPQnaCLE4yjhQXyQaYilXm6tHkl62G
 ViyNcMu3vVevgeX+8x2+JfHJlOOA0wU7dpU8KTcxanqnRexz3+GrvR18VvxaPAFnEkHc
 F4zNi60yEgn7bfVrlpq+fNT0KIXij6GMk9aWo+z31iWU0mVQgDWA87VoH1LjBiQcYN6f
 0Mlw==
X-Gm-Message-State: APjAAAXOSJEpggFJHjGxG4lNocEmP3APkC1Ch46J9NnKGVvlBLy7IqlP
 9k2BKY2Kp/6QrnL55gtvNjE69RvG
X-Google-Smtp-Source: APXvYqyTzNtW/PMQWgSv+qQpe8M/+AiE7rCrz/fEe5eSiVpw10XJHvRo2KQAlLkpWiaJ2WVIARY9Nw==
X-Received: by 2002:a0c:9638:: with SMTP id 53mr10162327qvx.13.1568929538881; 
 Thu, 19 Sep 2019 14:45:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id q44sm6231255qtk.16.2019.09.19.14.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 14:45:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu: fix documentation for amdgpu_pm.c
Date: Thu, 19 Sep 2019 16:45:26 -0500
Message-Id: <20190919214527.10803-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919214527.10803-1-alexander.deucher@amd.com>
References: <20190919214527.10803-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAVHrZSFAZjqZ0zzrbJu8XAHHCqwsOBXIzePmdlkEYY=;
 b=b68JFUJoXnUJEcHtJ73MWioOLntXc4DP6G62zEcMzOomxarQDvYmkfNvet/SMasK+l
 0OMKF4T7rxgy6CLKK+UCUX9OlEQ2qv4C0Gj8G41JVe6I/2rn4AjZ/3f7vsX4qi5wk7L8
 jtvomb4B7aBivO/gkvQRPIDzcBk3NXPDuHXgmJh8d9ArUxxOsFJCCRCfMcBHPFUFngGm
 ukrpWJ2SzRpJtKaUD22NGLBXdnS14n1mtmfRQLOtnj/4HXShauNXWiMdufvNe4D5pNop
 W/dOQLkVAJ/byo6hmcQ/jWpYU6Dndfvx/8Z7GpX464TvdrXwc3N68YVz0E8YQmFvFHnE
 pmsQ==
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

Rml4IERPQyBsaW5rIG5hbWUsIGNsZWFuIHVwIGZvcm1hdHRpbmcgaW4gcHBfZHBtXyogc2VjdGlv
bi4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBEb2N1bWVudGF0aW9uL2dwdS9hbWRncHUucnN0ICAgICAgICAgICB8ICA2ICsrKy0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgfCAxMyArKysrKysrKyst
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCBiL0RvY3VtZW50YXRpb24v
Z3B1L2FtZGdwdS5yc3QKaW5kZXggNWFjZGQxODQyZWEyLi44MGRiNWQ4OWNkNDkgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZ3B1L2FtZGdwdS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUv
YW1kZ3B1LnJzdApAQCAtMTMwLDExICsxMzAsMTEgQEAgcHBfb2RfY2xrX3ZvbHRhZ2UKIC4uIGtl
cm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwogICAgOmRv
YzogcHBfb2RfY2xrX3ZvbHRhZ2UKIAotcHBfZHBtX3NjbGsgcHBfZHBtX21jbGsgcHBfZHBtX3Bj
aWUKLX5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CitwcF9kcG1fKgorfn5+fn5+
fn4KIAogLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
bS5jCi0gICA6ZG9jOiBwcF9kcG1fc2NsayBwcF9kcG1fbWNsayBwcF9kcG1fcGNpZQorICAgOmRv
YzogcHBfZHBtX3NjbGsgcHBfZHBtX21jbGsgcHBfZHBtX3NvY2NsayBwcF9kcG1fZmNsayBwcF9k
cG1fZGNlZmNsayBwcF9kcG1fcGNpZQogCiBwcF9wb3dlcl9wcm9maWxlX21vZGUKIH5+fn5+fn5+
fn5+fn5+fn5+fn5+fgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwppbmRleCBi
ZGFkMDM0N2ZkZDguLmQ2Mzg2NjE2NDQ5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BtLmMKQEAgLTgwNSw4ICs4MDUsNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfZ2V0X3Bw
X2ZlYXR1cmVfc3RhdHVzKHN0cnVjdCBkZXZpY2UgKmRldiwKIH0KIAogLyoqCi0gKiBET0M6IHBw
X2RwbV9zY2xrIHBwX2RwbV9tY2xrIHBwX2RwbV9zb2NjbGsgcHBfZHBtX2ZjbGsgcHBfZHBtX2Rj
ZWZjbGsKLSAqIHBwX2RwbV9wY2llCisgKiBET0M6IHBwX2RwbV9zY2xrIHBwX2RwbV9tY2xrIHBw
X2RwbV9zb2NjbGsgcHBfZHBtX2ZjbGsgcHBfZHBtX2RjZWZjbGsgcHBfZHBtX3BjaWUKICAqCiAg
KiBUaGUgYW1kZ3B1IGRyaXZlciBwcm92aWRlcyBhIHN5c2ZzIEFQSSBmb3IgYWRqdXN0aW5nIHdo
YXQgcG93ZXIgbGV2ZWxzCiAgKiBhcmUgZW5hYmxlZCBmb3IgYSBnaXZlbiBwb3dlciBzdGF0ZS4g
IFRoZSBmaWxlcyBwcF9kcG1fc2NsaywgcHBfZHBtX21jbGssCkBAIC04MjIsOSArODIxLDE1IEBA
IHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9nZXRfcHBfZmVhdHVyZV9zdGF0dXMoc3RydWN0IGRldmlj
ZSAqZGV2LAogICoKICAqIFRvIG1hbnVhbGx5IGFkanVzdCB0aGVzZSBzdGF0ZXMsIGZpcnN0IHNl
bGVjdCBtYW51YWwgdXNpbmcKICAqIHBvd2VyX2RwbV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbC4K
LSAqIFNlY29uZGx5LEVudGVyIGEgbmV3IHZhbHVlIGZvciBlYWNoIGxldmVsIGJ5IGlucHV0aW5n
IGEgc3RyaW5nIHRoYXQKKyAqIFNlY29uZGx5LCBlbnRlciBhIG5ldyB2YWx1ZSBmb3IgZWFjaCBs
ZXZlbCBieSBpbnB1dGluZyBhIHN0cmluZyB0aGF0CiAgKiBjb250YWlucyAiIGVjaG8geHggeHgg
eHggPiBwcF9kcG1fc2Nsay9tY2xrL3BjaWUiCi0gKiBFLmcuLCBlY2hvIDQgNSA2IHRvID4gcHBf
ZHBtX3NjbGsgd2lsbCBlbmFibGUgc2NsayBsZXZlbHMgNCwgNSwgYW5kIDYuCisgKiBFLmcuLAor
ICoKKyAqIC4uIGNvZGUtYmxvY2s6OiBiYXNoCisgKgorICoJZWNobyAiNCA1IDYiID4gcHBfZHBt
X3NjbGsKKyAqCisgKiB3aWxsIGVuYWJsZSBzY2xrIGxldmVscyA0LCA1LCBhbmQgNi4KICAqCiAg
KiBOT1RFOiBjaGFuZ2UgdG8gdGhlIGRjZWZjbGsgbWF4IGRwbSBsZXZlbCBpcyBub3Qgc3VwcG9y
dGVkIG5vdwogICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
