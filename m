Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E11A0E55
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Apr 2020 15:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04266E877;
	Tue,  7 Apr 2020 13:27:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F566E877
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Apr 2020 13:27:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j19so1835144wmi.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Apr 2020 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J8sRzs+GDDX+cR98kHE5gY6hCreYdfdzrA9PmOHM+r8=;
 b=R/HeuPLEwM7rkINoGiYzOZnxNwWiUwrUN4eGr5btQOn7GVc5JADV5a5WsbpYhcwjyI
 ge/siWqVT/hR+hc3trRqyDVN1VVZLbIqo8M703OKbVF4e1NDaBeZLZz5sZc34PlZtNVZ
 X7KsvdkzoFyLZN3zYe5pyEYpA5uFG9hAv4PK7GgO0Y/OT2kI8jPTD+KkbR8+Pea+oZgw
 DxyoCuVxP9Pj/0BY9K1TaJMsToYrn0IkL+lrA9YmUC9/FgdEekWRl8wO4PBBGIB2+TIb
 PAvzd1QBEotfaph3LYyjQ4h+6Oel4mrbTv2ZRWhtbznemwUd9pXq5uFbvAzlIso96oML
 3dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8sRzs+GDDX+cR98kHE5gY6hCreYdfdzrA9PmOHM+r8=;
 b=F9RUv3pZSRQ3qdNjC/5hiHqfwSXA+p44BqvdXoLNDtEnFIqkUhIBGqw3NTXtG9BLed
 Gb7YOinBGwXWuobyDmjQDbPDBFt/oLpfuZiTpS52tr78Q5n4WSfYsgGlFSQ43hossdfx
 ph0UBbmu8MihfwNrex2rnVlJ1Pbuoxdyc5IvZ9YrNA+2DdLRcfGHYSSktTv/niR8IsTP
 Zzmnamzux1xyz2JvuYI3OaYJEQIqtAUMLWhVwVbfLnIGoo+Pd4FvHugH9gIsCAnijZLC
 FUGxKEG5no7339u8lpoO3HrvuW1vcovEgGOthX4+TVvuvKBjULpiDdmnYFWxSFtub+RA
 LfXQ==
X-Gm-Message-State: AGi0PuYBqiRyRTiOXXMPDZ6oguj6hFMutil+rcCl6ddmxP6792zRN7qX
 LKq9jLSYVf2mypaeSoZDD+SPHuqdDnuJ76TM1klIGbj/
X-Google-Smtp-Source: APiQypLZPQefbbzNcDU36+SSHT9vOwhwIi5bg8vhFMwie2nRSEovVzq46x7DMMUGidao5bXlhrDCVxlqky7G4NC9ZrY=
X-Received: by 2002:a05:600c:3d1:: with SMTP id
 z17mr2493694wmd.56.1586266040629; 
 Tue, 07 Apr 2020 06:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200407061814.16113-1-tianci.yin@amd.com>
In-Reply-To: <20200407061814.16113-1-tianci.yin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Apr 2020 09:27:09 -0400
Message-ID: <CADnq5_PgZjp_NWHzmgBAtuhjeDRWgYURHmamqRkuaUVs8wfqDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: add SPM golden settings for Navi14
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

On Tue, Apr 7, 2020 at 2:18 AM Tianci Yin <tianci.yin@amd.com> wrote:
>
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> Add RLC_SPM golden settings
>
> Change-Id: I5d3564aae13a7352514c0795b7d087d1534fe374
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
