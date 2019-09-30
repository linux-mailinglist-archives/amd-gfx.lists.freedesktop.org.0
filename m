Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6FFC2DEE
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 09:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894EC89F6B;
	Tue,  1 Oct 2019 07:41:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D816E4A5
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 17:08:47 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id y189so8469194qkc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 10:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xEuUJbPf6s33d8vxFyttJ6ib2KE1pdU7UtqDRbxWqHk=;
 b=lkFX3aX3ay6rvgPRglXvPZabzvN5cz1E26X1wh/jd/O8OsM/75pCFA2yopWdWx7skh
 eAMyq6sOV2DQ6rxgkiVyL15oOnWCSJ78Ao3asw/ZW0x5/4ji0eH2v/nk7hmhu2pzchqI
 z++xqJ4xkvEhTRKSIMg7TN9+ZpBkaufUX8rXxt3EdEnQWuqQwzD2atIkH2v2yA8KHtWp
 gCkaiAA6YagR7dv+nFCD2Q0P2nLGq2efpxH5NjICqCSOj2uJN3ymWZVq8zdEwje8dioD
 +9BhN/lCW2+lMAkH04JDLug1QyFiKzkL3arP1Ga/zjwasQ8HzNsncjRHvjhBwjBm1YVf
 cQ6A==
X-Gm-Message-State: APjAAAXjWH3Gs2altT/H6CbZdCMYxBQVZZxVjURv/C+H9ZMg+wLrHix8
 ZvHQUiTXBxeA4m4+v/3gqE9Fz9tTmQpAaZaktRvlZUVo
X-Google-Smtp-Source: APXvYqxtbIibGhZ0bNZo0g3kjODksPvOLeh2fMGrqII/41yeU7+eUYNMEYUXx6unkHDYMpiB9FmEKvQCs5dMswEqQ88=
X-Received: by 2002:a37:9ccc:: with SMTP id f195mr1146954qke.110.1569863326142; 
 Mon, 30 Sep 2019 10:08:46 -0700 (PDT)
MIME-Version: 1.0
From: Sjoerd Bergmans <sbergmans87@gmail.com>
Date: Mon, 30 Sep 2019 19:08:35 +0200
Message-ID: <CAHd=HQGT7duWkYZ+TRWFjpCSryuFBmXEwGKgZ7sGRT29vc92Rw@mail.gmail.com>
Subject: Re: Quick question for the mobile Raven Ridge auto-rotate function
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:41:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xEuUJbPf6s33d8vxFyttJ6ib2KE1pdU7UtqDRbxWqHk=;
 b=RpK/zY38Yz8eUjZnqUucleeQYa5/ikJjgko2eQ1U5Jh76qiSgQYA8qYVu0ptHa8sln
 qZRl/4ifCxwOgVPDHRq3qJLc8exuRg8f4r/hfhw6xG075R0mvpZ7TJUfvWR7/BIJJnO1
 0haJMzYhyaveNb7El+Wk/998eCSTfWHtphj2b1AbTL8Fx9GMleLZ/5NgyrjNKRY9qrKS
 TiCy02nvjqt9kU5zRIZK48kG0cQYdTEVQtTMf7+VvBLXBQNNO3pR/6c1O/vCOqXWW9O2
 u3flSg5nEcDtw2HpO/vJOhuVCn39/bFvLkcZcEmyJH45JH9SUhHif7tpjdEBeRDjQt3P
 BPRg==
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
Content-Type: multipart/mixed; boundary="===============0551161140=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0551161140==
Content-Type: multipart/alternative; boundary="000000000000e695550593c849b6"

--000000000000e695550593c849b6
Content-Type: text/plain; charset="UTF-8"

Hi,

Quick question regarding an earlier announcement;
https://lists.freedesktop.org/archives/amd-gfx/2019-May/034431.html

I feel a lot of Linux users are still waiting for the specified driver to
surface. Since you gave the original statement, might it be you are able to
offer any new insights or update?

Thnx!

--000000000000e695550593c849b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Quick question regarding an earlier=
 announcement;=C2=A0<a href=3D"https://lists.freedesktop.org/archives/amd-g=
fx/2019-May/034431.html">https://lists.freedesktop.org/archives/amd-gfx/201=
9-May/034431.html</a></div><div><br></div><div>I feel a lot of Linux users =
are still waiting for the specified driver to surface. Since you gave the o=
riginal statement, might it be you are able to offer any new insights or up=
date?</div><div><br></div><div>Thnx!</div></div>

--000000000000e695550593c849b6--

--===============0551161140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0551161140==--
