Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA21719F7F8
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Apr 2020 16:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5999D6E3E5;
	Mon,  6 Apr 2020 14:29:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26376E3E5
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Apr 2020 14:29:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h2so6888627wmb.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Apr 2020 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5AV2mTKAlLOSTwTxDj4bzEziEUnfkt3/KZ2rS4FILA=;
 b=m4cKiAPBAi9XyhzMHTUjQAwDIeXPBq1EcGNI05jVJ5kIywVtOLKqs58aWyZLo+um42
 OINhmEABt88you5WejMIinLZeR+OGtisVCS0Axkjuv+Hp5JC+pt8PGnxWk6aNrvU+GEc
 HJ3KYb+rYZQ49iWzPAIR+FS4ZK22QdVVWag7p6rDcs6Ewh3DO76ySVHhQELFzEHwnGN9
 hSkq4JXOlDukJbXxqnO7OUJoDomquencBRuUOKG+R6jVuhbzXqmQODbFtVRcLJ1Hzk6L
 ki7M3FwDBQmcpld6PAtTKSQbL2eizPKUubqjAEDLAJh7Hlsz5dm4LLfLbVaEBquXEZAd
 XDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5AV2mTKAlLOSTwTxDj4bzEziEUnfkt3/KZ2rS4FILA=;
 b=Ezs5rgJ0ZMXAPYYzoM09VODjFwckmmFxncL3cnYHPMvvWDqDEo8MhxUKKG6pRyIKYe
 ikoyAVfiW9X4qyH7qejvnf/1EgG9NP7d5Oc2mEhrYQfcAdAkVrxGWpxAxQagIYOCCZWH
 YtJqGhOvI3gbdTOn9ReMmS2iAI3OuE5bZyS1ZHctFEDNyebQo+LIhaujmgXe2WE5P0OC
 h9PtjOhMtGDIFeW8ZReExVlMX/iYO1v/WhR6vpNpzSLY+d4rUSbA0kVc1vO9BTzRwSmO
 RROI/Xke61gj2hZ6Jd5ZrPko+cTM7VGNu90QHqZSoErapDX0k/rfHcoKBiL7RLdbOjBB
 VZOQ==
X-Gm-Message-State: AGi0PuZPMK/rx3jIYN8aHe5RVbokdKBMTnG0z0XoFDjuVk5LhJtRq0SQ
 UIjoz1xgyedoTHZAVeleVxHMObz0oIoRNfANolQ=
X-Google-Smtp-Source: APiQypI6hj4SvuVc/rIW+srDUnIbVF4miTv36Q5P6Gbe4O6XSXGBfbTlvTJ7Q3oPO03J0LNUSEl3nFz+w9O9oFHIb+Q=
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr7201wma.70.1586183381464;
 Mon, 06 Apr 2020 07:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200406142632.2685-1-tianci.yin@amd.com>
In-Reply-To: <20200406142632.2685-1-tianci.yin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Apr 2020 10:29:30 -0400
Message-ID: <CADnq5_P0EPdqkt-xLA-+EtXsp2zKsdT1-Z6Ky4kPr4MMygR47A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add SPM golden settings for Navi10(v2)
To: Tianci Yin <tianci.yin@amd.com>
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Hesik Christopher <Christopher.Hesik@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 10:26 AM Tianci Yin <tianci.yin@amd.com> wrote:
>
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> Add RLC_SPM golden settings
>
> Change-Id: I616e127171293d915cb3a05dee02f51cec8d8f6f
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
