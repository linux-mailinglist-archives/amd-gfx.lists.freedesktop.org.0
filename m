Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F52DBBC4
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 06:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D4C6EAAD;
	Fri, 18 Oct 2019 04:24:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC946EAAD;
 Fri, 18 Oct 2019 04:24:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 195so3574643lfj.6;
 Thu, 17 Oct 2019 21:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sgp9sGsgBeS5MNI+vf6oBg0UkAKJwLtye9Npd4aZa9E=;
 b=BVmoZMMoA4t96g0NywWOcx51c41nDnlPzhP+/r7QrBtVhzqok7dZLQF70Em04elUUN
 LcNRAxJDd+lz17+mpzMlWVfiMq7ECnFXHiuWcMeyXTtSLlchkRxGERQ+YaGqwx9/wZVT
 sD9wxWtY149kCaxYA0ZGzo2nIYeXdcm5neUKXoH3Sg+v17R9suzoSJK02SMET/lGgFvD
 /+zkEetuWmzZLr1CWgaEyyLKhq0csdXdELfrLVtTVMqx75fdfFwmHkHi+0t1GTdiAiqH
 xlzJLnrT2aLDPl1wxDoUPmF80gtkXZIy2Dw1nrB9nlqzHCl0hkQV3J/REqlU6HzD0snv
 GE2g==
X-Gm-Message-State: APjAAAVQOlYrCNP+fCN5zMZk6E9sO7jbI6FmlAnmA/+2owGuBirUCbO+
 zdq0VjXtX9tZ1oPnU02ixpkUlwbBijrI/77OaNk=
X-Google-Smtp-Source: APXvYqysODgK/g+RF6GtPQBFSEtWGgFqfsxkwBN+C3OyDJeVDsNRn94Gz2XmThxXI2PJXns/3g/p39Iat+DAcPLGIT8=
X-Received: by 2002:a19:f107:: with SMTP id p7mr3001892lfh.91.1571372689753;
 Thu, 17 Oct 2019 21:24:49 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Oct 2019 14:24:38 +1000
Message-ID: <CAPM=9tzph8U-bMif3EghOx0wxjkosepv3Mi=HEWB9erSyMG2ow@mail.gmail.com>
Subject: radeon backtrace on fedora 31
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sgp9sGsgBeS5MNI+vf6oBg0UkAKJwLtye9Npd4aZa9E=;
 b=QX5VCvtm2uleHJfGgILdqfGCVZH5WMmal8Oqqdf2qp6RX3nwRM/a69P8Xu8H+tZYDB
 J5+3lb6/PsFirrSMiDdFsgUjdm0Y1kh71lpOcKXYu4mNu2z3SJLDWM1zvE6oeYFiiHsp
 u+8OHvd1rrXgFl1Z9k5e70pWsLjQyzD27jCw/j3WAhY1efhgnHsMsaHs/MiQZ9GmzQxn
 wSum1jdR5WppQDUeLumZ0vtWEhZ/919wbxYc/gsLqa7TNXnk3ODYfo1vZXhbOuSYsfjA
 amAQmcxvZ69rXUzHLjHz1HD/xG+LSb875mAE1Nl8gAfCAjkB6k7BCEKIPRcc8V69FWXg
 FtPg==
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

NS4zLjQtMzAwLmZjMzEueDg2XzY0CgpzZWVtcyB0byBiZSBuZXcuCgpodHRwczovL3JldHJhY2Uu
ZmVkb3JhcHJvamVjdC5vcmcvZmFmL3JlcG9ydHMvMjcyNjE0OS8KCgpEYXZlLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
