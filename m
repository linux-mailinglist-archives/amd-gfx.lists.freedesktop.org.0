Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F8377763
	for <lists+amd-gfx@lfdr.de>; Sun,  9 May 2021 17:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EA589F43;
	Sun,  9 May 2021 15:42:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359446E1CE;
 Sun,  9 May 2021 12:17:53 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id t21so7819006plo.2;
 Sun, 09 May 2021 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rgnivCnwUOL+7jUiwYwX1I74kp4hGBvTbYjp5pejkHE=;
 b=UUucRwKuPyr+T2+vaAhzhaV5jNNrauLGRImO37AvkiH9Wt8pWm7apR9rDD457wz1N5
 ebUSg2+3sZ7OA2NULiLrYD6mif8T2MT1dGNES7s6jhZYgESpA1v81QiacM4Y7MuKzWPV
 yCZVnO4hsO5Q65Q+tSsAeKKmARz1NWUKL6hulHxKMNWtsGhi/hKYnhUZ6liMpifFWw4L
 UM2m9yt6kJG4D9ss6jQNkirCZK0Cbiw1kyuDbEpyGBMO9i9HrFaASoqs5EOYCOupcAfp
 hCXicWBg8j+L+wP1/lwPk+ekgDZ4+yzawFDdombqsJvn/e1p4Z2eUabGED3ikcbqpnB3
 ilzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rgnivCnwUOL+7jUiwYwX1I74kp4hGBvTbYjp5pejkHE=;
 b=psYv2tt2+TYZLiH2ldK9b6AkRFBb5fxjUJpHXLc9ojZKRlA9ujxo+OwYPl2odXDzcG
 SFJpeazD6LvRdH/NBHirbj+xloewlTvajK4B7gws7d5lTHU4YTxN9TxkoWdDtswa/NIr
 gd2XjDButsbyC68H9I/DvdBZfobZfa7HkM6T5c3CSWHEQcslmU4bG2N+ctnbU8ImVI21
 0pXzk80ml9DpmjOLepOQ4LfFJFifItK08+a8BwQEM6GSEH9rF7ZP4fn4ErwGvNi+i7YU
 RnAINtkwNVLKmTBAgejmoE/YQkCVnUeuBbvyxxa2rX2iP3JO+Nz/CfAJcY5DJcMJVIO8
 67Dg==
X-Gm-Message-State: AOAM5313mP2LIThypjm/KuygNdJYV1oCorBugpvx5PCQpPIXPTJNL891
 9UmFxhXUyYO977EUfl0/M9M=
X-Google-Smtp-Source: ABdhPJwvX9JmBgkjMhR6w6ELWpMMw3nJlZIu09Um3ikaFUt2WdYfuZagyhv8eXoL2WRQZIRBSYzFoQ==
X-Received: by 2002:a17:90a:e003:: with SMTP id
 u3mr34503590pjy.77.1620562672731; 
 Sun, 09 May 2021 05:17:52 -0700 (PDT)
Received: from localhost.localdomain ([104.200.131.246])
 by smtp.gmail.com with ESMTPSA id x10sm8524430pjq.53.2021.05.09.05.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 05:17:52 -0700 (PDT)
From: youling257 <youling257@gmail.com>
To: markyacoub@chromium.org
Subject: Re: [PATCH v2] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
Date: Sun,  9 May 2021 20:17:41 +0800
Message-Id: <20210509121741.25858-1-youling257@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324201624.712307-1-markyacoub@chromium.org>
References: <20210324201624.712307-1-markyacoub@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 May 2021 15:42:11 +0000
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
Cc: amd-gfx@lists.freedesktop.org, michel@daenzer.net, daniel@fooishbar.org,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl,
 alexander.deucher@amd.com, markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

I using amd 3400g running with android-x86, this patch is a bad commit when i use android-x86 on amdgpu.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
