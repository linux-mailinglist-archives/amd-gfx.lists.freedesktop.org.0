Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE7ACC7BA
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Jun 2025 15:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBBC10E622;
	Tue,  3 Jun 2025 13:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F9YrQGo/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7550010E010
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Jun 2025 12:27:04 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-70e2b601a6bso51165787b3.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Jun 2025 05:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748953623; x=1749558423; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KS9rkPTGJqa2rNA3qxQ2zxOhS+BwbC1h7+9syRUgbFA=;
 b=F9YrQGo/T+meVBqx4DUOQ/mth2n0+HD3HKzSXLGGcSyY430KDjo3RcdDpxZLzZW4lB
 6gCXBwTxPukEu8nOweXbQXpZmzBjuWzqSYG5+EQL16hLQTLHEW8trjdcqwRbFz7p5wKo
 cjKTvIXSWgXtrmQy9WaSSMLxp0XRPWZoAsFw0pI2xpOiYGJfoJfguBR7KprGPR8TnXUI
 p42lN6UmHvsRBw+oVm4zHWuy1AX9Geq1Qc0W5yhf2iyVMHTRl9NgKTcbtQYuSi4vEVdI
 wxsIH0X5OK3B4fAPNz1/MVaCSGPqNEHhBcfSKl9B6H1RTCKJDd6QIrZy0jhmWdGFbe0l
 SKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748953623; x=1749558423;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KS9rkPTGJqa2rNA3qxQ2zxOhS+BwbC1h7+9syRUgbFA=;
 b=RmPbvDnKuG5CmHTwEXcInjubACOAdX+S3JUw1JdpC+zQwqxziwyNNLNjWiYvrCJCFu
 Dt9WJ7Zx9W5fGXQfZJaZpE9sKFLiJeiMvL4Bzb3YDZ6v/lPVJ3RAACABd5k/4aRR8KZF
 Ox3ZW5iKU5D2b9SwVO1ZqU7N94ms6P9aj+FQrRsdOtnpwFQwWjZQTcVe7B2KCa5/ITwF
 oznBTSl6/iIUknITX1tPzA4DMg2PveLbiESF9l1XtQXDRnCM5npczMG1WuRRvG4f+GjM
 fNfBBWkxHLv0BRmFPCNSYRMO98SMoSiLfQdd/O09qLQuVTmcSsDHc8dMRHesB9U53rta
 syuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVop0OdrlfHAdEKaZeCzM6BSjmmc3bVfSbGHjpWC+z10AAwV/Dw8XBDr7YcgBTi4EMdiWvkXmSr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVoxNpNEqcrCt6gdfzTX3Wgjm6FwTmPS1q+uYAh8cCI42dXWvt
 6MOFbWtZrzV629FBXlfEYZmsS5YEdzN2/RHlFv58X9pCPWSGoKWHVZHye3uc441HjnR4ti/KLkQ
 Y/i53EVP1csZ4FpxT0u2FSdsn0iXaXds=
X-Gm-Gg: ASbGncv4YTioEfXfhX5zz3mu6acx8XHNbwhdU1j4SY1PERF4lCah/EGsIeA8HcpE1aR
 6NfEm62NP13WMX0Yd0GdkOHPEWMbmAWcb+k2afc0pHuUBm1AOQP7GzsWkr3mUQ0hAQgCGmEsv7R
 GuunZULEKq1TpstrFZ33e+l1IqMnW/4dDCFjiomSL2T8KUkZ+Z685t3N75hnnOsgGF8w==
X-Google-Smtp-Source: AGHT+IEbfkw52dYwb3QTIYKq+WBEWXWfcgfIwhgKwctTOG2OKjmN/e1jk1HhPX0yI+JSVRibG8FbMs6A5Hv3I1EPdFI=
X-Received: by 2002:a05:690c:7488:b0:70e:5eda:4810 with SMTP id
 00721157ae682-70f97e784dcmr265465657b3.13.1748953623445; Tue, 03 Jun 2025
 05:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <aD2U3VIhf8vDkl09@debian.local>
 <CAJZ5v0h-nrVamqiAJ957aYjHqaeAZUUW7BRi0WxPgCFc40M5cQ@mail.gmail.com>
 <7f0e2865-d35e-4a13-8617-8679afb4b23f@kernel.org>
 <CAJZ5v0gL3rW8dOxXdPWYjZuq5kAaD8qTa4vZ5++k9+0WniNAdQ@mail.gmail.com>
 <CAJZ5v0jDZQaR8S6Kn_RoXHBU86+tpjp=qgyxm5h03YEe2S=nPg@mail.gmail.com>
 <aD7L0RD4HT-mEtBc@debian.local>
 <CAJZ5v0h65Gt1Fw35vp2k8kKu62+goCD8WF8u-tvhfWW6a7xHxQ@mail.gmail.com>
 <CAJZ5v0ggPHhYcdNos2o8savvq+-zpPTaQunjOkR36k3VwF3_CA@mail.gmail.com>
 <CAJZ5v0gF=ewooE0cUrNfe5_inhnzq6bqw8VTjkFwr56_wrptJQ@mail.gmail.com>
 <CAJZ5v0hpJSVdiCN29=kbV8KfgU1y1d3hFfshtBoMpVFXf+LvBQ@mail.gmail.com>
 <aD7nOMP3xA9BR781@debian.local>
 <CAJZ5v0gAcohRWuSZbFWvyfAU9Vjc7nRyj+AFRYQ7hcGEXdPxyQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0gAcohRWuSZbFWvyfAU9Vjc7nRyj+AFRYQ7hcGEXdPxyQ@mail.gmail.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Tue, 3 Jun 2025 13:26:52 +0100
X-Gm-Features: AX0GCFuyhCVtL8Hjsbmm71G8qbnwHENp7Q1i1Zyf7FagPmfvh1ldlhfNBWSaUl8
Message-ID: <CAP-bSRbVjcXBvxDT6ZQuoRB+JF6A4LhdMVnNqnaQC0bg-xg2BQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] PM: sleep: Suspend async parents after suspending
 children
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
 Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johan Hovold <johan@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jon Hunter <jonathanh@nvidia.com>, Saravana Kannan <saravanak@google.com>, 
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 03 Jun 2025 13:27:06 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, 3 Jun 2025 at 13:24, Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > This patch does fix the list corruption, but the "Unbalanced
> > pm_runtime_enable" still occurs:
>
> Have you applied it together with the previous patch?

Yes
