Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E46D1FFB
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 07:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25C96EA89;
	Thu, 10 Oct 2019 05:23:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Thu, 10 Oct 2019 05:17:11 UTC
Received: from mx5.ucr.edu (mx5.ucr.edu [138.23.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762C06E113
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 05:17:11 +0000 (UTC)
IronPort-SDR: ySIKci+DeNCcbdpS+Bb7FC4fjFNX7pqT0BF6GGa0aA8j1GVq4Tv3hnbA28E9pWF5MPMYbD5IQI
 rjxZKpPZhBhv01IhQ8uzD1cGE3NPW7s7X8lWcoDnT7wS24S/BsYHfrJNpohblAd54piuZhxW4M
 +Gph7CvImAfnJfSCDukOYDDclTeNKAesHGsuksaq01Q17vLsyGlf4XcaVkT6Aum8J+rE+S/Puf
 Lzf9I86UYSCUUebIE6lB9rVRu6jwA7fUteOfFXBjQTXon/dQcv3jhGW7QMY57Ja6VQSDSZZHHZ
 7ZM=
IronPort-PHdr: =?us-ascii?q?9a23=3AGw00PhJQCNSrFJqUQNmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgXK/X7rarrMEGX3/hxlliBBdydt6sfzbSM+PG7EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oLRi6swrdu80YjIB/Nqs/1x?=
 =?us-ascii?q?zFr2dSde9L321oP1WTnxj95se04pFu9jlbtuwi+cBdT6j0Zrw0QrNEAjsoNW?=
 =?us-ascii?q?A1/9DrugLYTQST/HscU34ZnQRODgPY8Rz1RJbxsi/9tupgxCmXOND9QL4oVT?=
 =?us-ascii?q?i+6apgVQTlgzkbOTEn7G7Xi9RwjKNFrxKnuxx/2JPfbIWMOPZjYq/RYdYWSG?=
 =?us-ascii?q?xcVchTSiNBGJuxYIQPAeQPPuhWspfzqEcVoBuiGQWhHv/jxiNUinL026Axzu?=
 =?us-ascii?q?QvERvB3AwlB98BsnXUrdT1NKcPVuC+0arHzTXZYPNXxDzw74jJcxEhof6WXL?=
 =?us-ascii?q?J8bdbdxEc0GgPYklqQs5bpMC2I2eQQqmWW6fdrW+G3i2M/tQ19vjyiyt0vh4?=
 =?us-ascii?q?TJnI4Z11HJ+CdjzIs3ONG1TlNwb8S+H5tKrS6aMpN7QsYlQ251pik30qYGuZ?=
 =?us-ascii?q?unfCgSz5Qn2gLfZ+SHc4eW5hLjU/6cITJii3JkfLKznhKy8Ua9xuHlWMm50k?=
 =?us-ascii?q?tGojBKktnLsXAN2BjT5dadRvRh+Ueh3C6D1wHV6u5aPUA5jbTXJ4Ilz7IqlZ?=
 =?us-ascii?q?cesV7PEjL3lUj0lqObdFgo9vCt6+v9Y7XmopGcN5VzigH7Kqkvms2+AeQiPQ?=
 =?us-ascii?q?gPQ2SX5eqx2ab+/ULlWrVGlOM5nbTEsJzCP8QUura5AxNJ0oYk8xuwFTKm38?=
 =?us-ascii?q?kBkXkIIlJEdwmKj4zoO1HVPPD4Fu2zg1q2kDh12f/JI6PuAo7OLnjfl7fhZa?=
 =?us-ascii?q?xx60lGyAo8nphj4Md9DrwRaN7+R0TxucaQWhY9Phy9xerqEpNx254VWW+VKq?=
 =?us-ascii?q?acPOXZtlreoqoEI/ONf5MUsTDKCGYj5vGm2XQ5g14GYaig290Ub32+H/tOKk?=
 =?us-ascii?q?CVJ3Hrh4FFWS0mtxQ/QKSqo12fVxtSYXnzF5A84SxxQNaKBJnCStnrsryGwQ?=
 =?us-ascii?q?+yG5EQbWdDXBTEPX72donMcvYWbCOfaptokyYAVLWtY4sg0wy+8g73nf4vAu?=
 =?us-ascii?q?PS+yAc/azuyMR4/aWHmRg09DFwJ8qTzGWJCWp0yCdAfDYzlJp2v0p3zU2Mmf?=
 =?us-ascii?q?xjivlwD9VN4flOSAh8MoTTmagyJs77XEr4Y96PAAKrXNygRygsR9QZytoCJU?=
 =?us-ascii?q?16HoPmxjLK1CniM74ckPTfJpU/8eTs3nH2D894xzDN06x3yxEvR8cKOmO2rq?=
 =?us-ascii?q?p+7BTIQYDTnkiVmr2paaMEminX+yPLwXCP+U1VTgN0eaHERmwEIEXMoNn161?=
 =?us-ascii?q?jBU7i2T7M9PU8Jzc+EN7sPadDzi1hCbOnsNc6YYG+rnWq0QxGSyffEXorran?=
 =?us-ascii?q?gblBzcAU5MxxIT/GebMxEWDTznvmnESjFiCASrK2js/O9xuW7zdUgywEneZF?=
 =?us-ascii?q?Zm0bWd8QVTmPeGDf4fw+RXlj0mrmBFHUS9wtWeOdqJpkI1bbdcaNJluAxvyG?=
 =?us-ascii?q?nD8QFxI8rzfOhZmlcCflEv7AvV3BJtB9AFyJByoQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FRAwBgvJ5dh0enVdFlDhABCxyGDIR?=
 =?us-ascii?q?NjluFFwGNaYo0AQgBAQEOLwEBhxgjOBMCAwkBAQUBAQEBAQUEAQECEAEBAQg?=
 =?us-ascii?q?NCQgphUCCOikBg1URfA8CJgIkEgEFASIBGhqDAIJ4BaQ6gQM8iyaBMoQLAQG?=
 =?us-ascii?q?EWgEJDYFIEnoojA6CF4ERiyKCXgSBOQEBAZUvllcBBgKCEBSMVIhFG4IqAZc?=
 =?us-ascii?q?Vji2ZTw8jgUaBezMaJX8GZ4FPTxAUgWmNcQQBViSRSwEB?=
X-IPAS-Result: =?us-ascii?q?A2FRAwBgvJ5dh0enVdFlDhABCxyGDIRNjluFFwGNaYo0A?=
 =?us-ascii?q?QgBAQEOLwEBhxgjOBMCAwkBAQUBAQEBAQUEAQECEAEBAQgNCQgphUCCOikBg?=
 =?us-ascii?q?1URfA8CJgIkEgEFASIBGhqDAIJ4BaQ6gQM8iyaBMoQLAQGEWgEJDYFIEnooj?=
 =?us-ascii?q?A6CF4ERiyKCXgSBOQEBAZUvllcBBgKCEBSMVIhFG4IqAZcVji2ZTw8jgUaBe?=
 =?us-ascii?q?zMaJX8GZ4FPTxAUgWmNcQQBViSRSwEB?=
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; d="scan'208";a="81860475"
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Oct 2019 22:10:00 -0700
Received: by mail-lf1-f71.google.com with SMTP id e1so1053482lfb.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 09 Oct 2019 22:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GIIH2P83q/mX3xh3maQPqHlz4QJ+Z9HFyeC3gCwbPig=;
 b=kYwEd8q0iSJxgjYNFaLhkw7AX4B65oBYDnM5zdLdiaY+/1q9GySq00mRK2JD36jFU9
 +o/CVU0cOGKHZaTZXVmRcnHBbmOsTws1adtrx122ROW/16rnB4XDrnCWQLTMKstBA7PL
 rivjoQSUelCrWKrQKSAd8M98u1sRGmjuZHRcNxULWEV4WrxnAH0dkHum5pbQZOMG+I7c
 mTSeYB0WRPZmgI/OYeW9dVfDmaShmDPwvvpiuMajgRTJu3jlaO4ErVs7qIB1nJVF8ikb
 qMfW7pKXvf0b5vyIy6S4lXapViUFt3Pv9CCGpSnm1cqJrX/YiU5fIhkgXH1obYUytm1e
 1f2w==
X-Gm-Message-State: APjAAAWN17YblVG5M4Lpo8FES09+I0KzXkziZSM4xvVSpyCe+hNoCSOR
 kjbEkoglgR/5mI1yXJjwy2M6CSKQ4uNkecksm3bVS7BSpSGvIB30+/tMo65eTbDV5LY1xCuUCf+
 0s7JGB6mQBUpqfQ7mUleh00kFzGw2x1l5GCmq/uLexLE=
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr4795059ljc.97.1570684198372;
 Wed, 09 Oct 2019 22:09:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4+Ag+0zjeb2o0SrDvuaa8jOaPuDPdyg3zpbOVtTOkjtWQ+gGvmWw+7mH9RDBzjC8jtfHcYs2qafTJb+Kg2A8=
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr4795013ljc.97.1570684197726;
 Wed, 09 Oct 2019 22:09:57 -0700 (PDT)
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Wed, 9 Oct 2019 22:09:32 -0700
Message-ID: <CABvMjLQuxeZnRMV0T5VDeEj7zV7mD4wzp5QPFCJ_oVhH0vRihQ@mail.gmail.com>
Subject: Potential NULL pointer deference in drm/amdgpu
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Evan Quan <evan.quan@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Zhiyun Qian <zhiyunq@cs.ucr.edu>, 
 Chengyu Song <csong@cs.ucr.edu>
X-Mailman-Approved-At: Thu, 10 Oct 2019 05:23:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1570684631; x=1602220631;
 h=mime-version:from:date:message-id:subject:to;
 bh=pQsPO+s+a3PgY5D8E1xj+ga8C5+DTSwnG2XjsOjt7mI=;
 b=YbmbzI2fpG4rzRJ04fWyMgMV6la8OPn4TvJPf2y0s+ZVnZHOQqrxtIkJ
 HBbNguh/TY5jH7NIFAPInS/B1bPB1dh0go84PyWVxfc5zg7AlpiGPq2pp
 C6j/TYCgU5oXNfYuE6L1eyadqEhjVGhQUmeWFkZlxdVpZeNZrmQp+wCwB
 +NCNJp+cyt0s7oyEa7cAE89FeFB+Pan2UpSY4D4dWMqaT6562Q/wP6WMy
 aE6h6iz/Zq87hVa37JuTB5Yw80DRhsBn77ZHDBAWGxiYo5ckHvojth+8t
 b1GCue50u+SeQgGQLKUXF42VXyUnPdyK6kwcfK6jIXPP1nN4v7QJtaN/p
 A==;
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

SGkgQWxsOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYzoKVGhlIGZ1
bmN0aW9uIHRvX2FtZGdwdV9mZW5jZSgpIGNvdWxkIHJldHVybiBOVUxMLCBidXQgY2FsbGVycwpp
biB0aGlzIGZpbGUgZG9lcyBub3QgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBidXQgZGlyZWN0bHkg
ZGVyZWZlcmVuY2UgaXQsCndoaWNoIHNlZW1zIHBvdGVudGlhbGx5IHVuc2FmZS4KU3VjaCBjYWxs
ZXJzIGluY2x1ZGUgYW1kZ3B1X2ZlbmNlX2dldF90aW1lbGluZV9uYW1lKCksCmFtZGdwdV9mZW5j
ZV9lbmFibGVfc2lnbmFsaW5nKCkgYW5kIGFtZGdwdV9mZW5jZV9mcmVlKCkuCgoKLS0gCktpbmQg
UmVnYXJkcywKCllpemh1byBaaGFpCgpDb21wdXRlciBTY2llbmNlLCBHcmFkdWF0ZSBTdHVkZW50
ClVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYSwgUml2ZXJzaWRlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
