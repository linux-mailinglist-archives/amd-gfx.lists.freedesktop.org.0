Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86787162DAB
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Feb 2020 19:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134006E3B0;
	Tue, 18 Feb 2020 18:02:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AEB6E3B0;
 Tue, 18 Feb 2020 18:02:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c9so25106321wrw.8;
 Tue, 18 Feb 2020 10:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5R88FGnPjhsQadJtsU+Gi9+2LMayu3HLn44l5p9s88=;
 b=N5QGfRDRA2X9GmasAl0gSPur1ZbJcHybQJ65XK/qWKMbER4n9+0Sz5bdQta9JdwAGo
 PqqhfgKPrxj/aEwc6HSPMgtdPol+UXFOi0a/OO0nGtaoxPXXi788/kGumag/jeF9gcm3
 iDMvTYzpMyn9xbTcdDXXaNKGOSBj8NxGOJmn571YPZ8LMcIV3yW+30oVPjjUXgefmY/C
 W4glXbgoJ+EiX94mIf/6sAJHCa7mdDCcEiGtLiuJWU1QgcQiCUf5j/IG3X3ETmjg/d5b
 ECdaQrplM60Ibap489pOhTNe+EOI4f1RH05ejU5X0otVfQB6p3z0g633J9sONiDZ9MU7
 vfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5R88FGnPjhsQadJtsU+Gi9+2LMayu3HLn44l5p9s88=;
 b=tsi0qFjPLuWjirVwtVRenN0fno9J/FxjKwRCc2jNbv6na62QgyOSh7KDyEC5tAdZ7R
 C4KbDBPSV+FZEMdeDaO8VMdJKLXMe2tG1mUSQFL+xjYP79CRukfPnfUY1khXC9qx5PfK
 gbXoxYedpJcZ1O9eSVmVYcnAlVT5/XQ0Lq80kprD5MB6P3+RTN6r0iNthwsmk4x2CRwJ
 nnjiDTvOQFeq16TD+UPbPVUMgRKpgYDvmktFqjc7oKkwES9MdN6Y9WcIfsdc5UHVf8WH
 zsrJGsPjhj8Jk5VYRAn49XEhuHuZBk1uUclSV3e5qT5jGJG96Tiz6Vo06Xb28ZzB1Rbr
 56Nw==
X-Gm-Message-State: APjAAAWWBIZGBiyTEs9vr54NIOfu79EEjDY3wAfFgFxsuVX5CZuAxCuV
 NsefOoQQ+H8JiYsMxAttQkf2AbicJdGI5Q==
X-Google-Smtp-Source: APXvYqwkWJQg5wp45GBNA6FMb7wfQYdXh2VF17SYZDCTnlU9oSN0n2go4g4TYRPUnYP+yepHjmCsVA==
X-Received: by 2002:a5d:4702:: with SMTP id y2mr29084186wrq.37.1582048945877; 
 Tue, 18 Feb 2020 10:02:25 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2CE900751228326401B174.dip0.t-ipconnect.de.
 [2003:c5:8f2c:e900:7512:2832:6401:b174])
 by smtp.gmail.com with ESMTPSA id d16sm7872733wrg.27.2020.02.18.10.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 10:02:24 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/qxl: don't use ttm bo->offset
Date: Tue, 18 Feb 2020 19:04:51 +0100
Message-Id: <20200218180454.81866-6-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218180454.81866-1-nirmoy.das@amd.com>
References: <20200218180454.81866-1-nirmoy.das@amd.com>
MIME-Version: 1.0
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
Cc: David1.Zhou@amd.com, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, maarten.lankhorst@linux.intel.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCByZW1vdmVzIHNsb3QtPmdwdV9vZmZzZXQgd2hpY2ggaXMgbm90IHJlcXVpcmVk
IGFzClZSQU0gYW5kIFBSSVYgc2xvdCBhcmUgaW4gc2VwYXJhdGUgUENJIGJhcgoKVGhpcyBwYXRj
aCBhbHNvIHJlbW92ZXMgdW51c2VkIHF4bF9ib19ncHVfb2Zmc2V0KCkKClNpZ25lZC1vZmYtYnk6
IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oICAgIHwg
NiArKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jICAgIHwgNSArKy0tLQogZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmggfCA1IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF90dG0uYyAgICB8IDkgLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAppbmRleCAyN2U0NWEy
ZDZiNTIuLmRmNTgxZjBlNjY5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
ZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmgKQEAgLTEzNCw3ICsxMzQs
NiBAQCBzdHJ1Y3QgcXhsX21lbXNsb3QgewogCXVpbnQ2NF90CXN0YXJ0X3BoeXNfYWRkcjsKIAl1
aW50NjRfdAlzaXplOwogCXVpbnQ2NF90CWhpZ2hfYml0czsKLQl1aW50NjRfdCAgICAgICAgZ3B1
X29mZnNldDsKIH07CiAKIGVudW0gewpAQCAtMzExLDEwICszMTAsOSBAQCBxeGxfYm9fcGh5c2lj
YWxfYWRkcmVzcyhzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwgc3RydWN0IHF4bF9ibyAqYm8sCiAJ
CShiby0+dGJvLm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfVlJBTSkKIAkJPyAmcWRldi0+bWFpbl9z
bG90IDogJnFkZXYtPnN1cmZhY2VzX3Nsb3Q7CiAKLQlXQVJOX09OX09OQ0UoKGJvLT50Ym8ub2Zm
c2V0ICYgc2xvdC0+Z3B1X29mZnNldCkgIT0gc2xvdC0+Z3B1X29mZnNldCk7CisgICAgICAgLyog
VE9ETyAtIG5lZWQgdG8gaG9sZCBvbmUgb2YgdGhlIGxvY2tzIHRvIHJlYWQgYm8tPnRiby5tZW0u
c3RhcnQgKi8KIAotCS8qIFRPRE8gLSBuZWVkIHRvIGhvbGQgb25lIG9mIHRoZSBsb2NrcyB0byBy
ZWFkIHRiby5vZmZzZXQgKi8KLQlyZXR1cm4gc2xvdC0+aGlnaF9iaXRzIHwgKGJvLT50Ym8ub2Zm
c2V0IC0gc2xvdC0+Z3B1X29mZnNldCArIG9mZnNldCk7CisJcmV0dXJuIHNsb3QtPmhpZ2hfYml0
cyB8ICgoYm8tPnRiby5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkgKyBvZmZzZXQpOwogfQogCiAv
KiBxeGxfZGlzcGxheS5jICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9r
bXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jCmluZGV4IDcwYjIwZWU0NzQxYS4u
N2E1YmY1NDRmMzRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9rbXMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9rbXMuYwpAQCAtODYsMTEgKzg2LDEwIEBAIHN0
YXRpYyB2b2lkIHNldHVwX3Nsb3Qoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCiAJaGlnaF9iaXRz
IDw8PSAoNjQgLSAocWRldi0+cm9tLT5zbG90X2dlbl9iaXRzICsgcWRldi0+cm9tLT5zbG90X2lk
X2JpdHMpKTsKIAlzbG90LT5oaWdoX2JpdHMgPSBoaWdoX2JpdHM7CiAKLQlEUk1fSU5GTygic2xv
dCAlZCAoJXMpOiBiYXNlIDB4JTA4bHgsIHNpemUgMHglMDhseCwgZ3B1X29mZnNldCAweCVseFxu
IiwKKwlEUk1fSU5GTygic2xvdCAlZCAoJXMpOiBiYXNlIDB4JTA4bHgsIHNpemUgMHglMDhseFxu
IiwKIAkJIHNsb3QtPmluZGV4LCBzbG90LT5uYW1lLAogCQkgKHVuc2lnbmVkIGxvbmcpc2xvdC0+
c3RhcnRfcGh5c19hZGRyLAotCQkgKHVuc2lnbmVkIGxvbmcpc2xvdC0+c2l6ZSwKLQkJICh1bnNp
Z25lZCBsb25nKXNsb3QtPmdwdV9vZmZzZXQpOworCQkgKHVuc2lnbmVkIGxvbmcpc2xvdC0+c2l6
ZSk7CiB9CiAKIHZvaWQgcXhsX3JlaW5pdF9tZW1zbG90cyhzdHJ1Y3QgcXhsX2RldmljZSAqcWRl
dikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5oIGIvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmgKaW5kZXggOGFlNTRiYTc4NTdjLi4yMWZhODEwNDhm
NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5oCkBAIC00OCwxMSArNDgsNiBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcXhsX2JvX3VucmVzZXJ2ZShzdHJ1Y3QgcXhsX2JvICpibykKIAl0dG1fYm9f
dW5yZXNlcnZlKCZiby0+dGJvKTsKIH0KIAotc3RhdGljIGlubGluZSB1NjQgcXhsX2JvX2dwdV9v
ZmZzZXQoc3RydWN0IHF4bF9ibyAqYm8pCi17Ci0JcmV0dXJuIGJvLT50Ym8ub2Zmc2V0OwotfQot
CiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcXhsX2JvX3NpemUoc3RydWN0IHF4bF9ibyAq
Ym8pCiB7CiAJcmV0dXJuIGJvLT50Ym8ubnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX3R0bS5jCmluZGV4IDYyYTVlNDI0OTcxYi4uNjM1ZDAwMGU3OTM0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF90dG0uYwpAQCAtNTEsMTEgKzUxLDYgQEAgc3RhdGljIHN0cnVjdCBxeGxfZGV2aWNlICpxeGxf
Z2V0X3FkZXYoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpCiBzdGF0aWMgaW50IHF4bF9pbml0
X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCQkJ
ICAgICBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbikKIHsKLQlzdHJ1Y3QgcXhsX2Rl
dmljZSAqcWRldiA9IHF4bF9nZXRfcWRldihiZGV2KTsKLQl1bnNpZ25lZCBpbnQgZ3B1X29mZnNl
dF9zaGlmdCA9Ci0JCTY0IC0gKHFkZXYtPnJvbS0+c2xvdF9nZW5fYml0cyArIHFkZXYtPnJvbS0+
c2xvdF9pZF9iaXRzICsgOCk7Ci0Jc3RydWN0IHF4bF9tZW1zbG90ICpzbG90OwotCiAJc3dpdGNo
ICh0eXBlKSB7CiAJY2FzZSBUVE1fUExfU1lTVEVNOgogCQkvKiBTeXN0ZW0gbWVtb3J5ICovCkBA
IC02NiwxMSArNjEsNyBAQCBzdGF0aWMgaW50IHF4bF9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCWNhc2UgVFRNX1BMX1ZSQU06CiAJY2Fz
ZSBUVE1fUExfUFJJVjoKIAkJLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwotCQlzbG90ID0gKHR5
cGUgPT0gVFRNX1BMX1ZSQU0pID8KLQkJCSZxZGV2LT5tYWluX3Nsb3QgOiAmcWRldi0+c3VyZmFj
ZXNfc2xvdDsKLQkJc2xvdC0+Z3B1X29mZnNldCA9ICh1aW50NjRfdCl0eXBlIDw8IGdwdV9vZmZz
ZXRfc2hpZnQ7CiAJCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5jOwotCQltYW4tPmdw
dV9vZmZzZXQgPSBzbG90LT5ncHVfb2Zmc2V0OwogCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVf
RkxBR19GSVhFRCB8CiAJCQkgICAgIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+
YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwotLSAKMi4yNS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
