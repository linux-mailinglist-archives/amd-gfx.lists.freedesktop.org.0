Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F532CE05
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Mar 2021 09:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED56189D7D;
	Thu,  4 Mar 2021 08:03:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A856989D7D
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Mar 2021 08:03:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m1so8678491wml.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Mar 2021 00:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CVDVmJiOts/hkD0pC9N9slRcnyluWEqZQ1zKljo8ags=;
 b=mcaT6Cp8izYv7ry9yC1o0aIwcNhNVekTN543yJcY62prEj+HVlp+06ZVqoWbErm9Iv
 3oK561528tG8Jsj1x7f1iFEm89X7/2IuNrmVe6wQA0pRKVjFcDg9csdgqGzrHUSFYxIC
 MPeUWU80jeLoNAbLm2RzsQbp/ycd+zksTAYsEDGl9fMEswLzuQ9OlOa92H2iw4X7w8sF
 aXV5OqaDNOsGmSCpcnLFRZG7AXOrmP/V+g2K5F4Xe7vrG5UNk683PdYWM54KiTsH2DuX
 VP67VzD2ptX8PKaPxRaFPyZKedLc5u9INR8HhrhK85YxGJo9Rvwt7+qCP3vtQ+IlcBfW
 28KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CVDVmJiOts/hkD0pC9N9slRcnyluWEqZQ1zKljo8ags=;
 b=eMr8ODhlRdXBlbkEKASbaoy9cUuQrR862ym9kEwY5d4pA/FmRKCsJEnhpqnzR+fdMA
 wY+IZfPbQuv+I6mlS2mnV0Icp6lBnukkFkPVXgVDcwrQRnIbi+a96oQciygGLFwF7irW
 No7kdPI6O+VJa6Uen1Y1pc7XG9QsgoL0hlASXfd5STDXdkewuNLuaUjrE69kQQTrJz84
 KYYOHGZSBbF2eyQ0gWwdArnvLZo8MJwCJsZtWBN6gvmVFNnDTDEEcG71S3T+gEdddfuc
 W6irUz4Yi9rFWcw9rOJ/Ti1AWHkdr+FZwo90DoeY8MsXAoa5Jg0lFnRoMEbBQUdejK6E
 szNw==
X-Gm-Message-State: AOAM533XAUgUaqRDR5n876rBo/c2BqpIUw3TUEyM+wK6xw5696/uz94v
 orJb4v93m92GN6pPncq5X1G98VWZiqGXjlSkupSy1fNwXgg=
X-Google-Smtp-Source: ABdhPJxFmfyEa7uFooQRxxDOzSptU2/+HkjnFuBPSo/bFfoYmU8POgl42W4ZS4eYh+9+gUqzBZjlHVMYO8Z+HfcT6LA=
X-Received: by 2002:a1c:e905:: with SMTP id q5mr2633628wmc.84.1614845019253;
 Thu, 04 Mar 2021 00:03:39 -0800 (PST)
MIME-Version: 1.0
From: Smith John <ls.cat.kth@gmail.com>
Date: Thu, 4 Mar 2021 16:03:27 +0800
Message-ID: <CAGztBWWAv2ei=JvJvG6hvGp_275rFwQvFtzSaC4kbuCDgNBZEQ@mail.gmail.com>
Subject: [amdgpu] Can compute kernels with different VMIDs run concurrently on
 the gpu hardware
To: amd-gfx@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============0010060699=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0010060699==
Content-Type: multipart/alternative; boundary="000000000000bd6ea705bcb16725"

--000000000000bd6ea705bcb16725
Content-Type: text/plain; charset="UTF-8"

Hi! I noticed that kernels with different VMIDs have different GPU address
spaces. I was wondering if it is possible for these kernels to run
concurrently on the same GPU, or they need to be serialized even when there
are free CUs.

--000000000000bd6ea705bcb16725
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi! I noticed that kernels with different VMIDs have different GPU address spaces. I was wondering if it is possible for these kernels to run concurrently on the same GPU, or they need to be serialized even when there are free CUs.</div>

--000000000000bd6ea705bcb16725--

--===============0010060699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0010060699==--
