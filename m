Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F1E507AFD
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Apr 2022 22:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB7410EAD3;
	Tue, 19 Apr 2022 20:31:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B620E10E9D3
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Apr 2022 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650400265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=be6VP4VL+z444uHhPHKMJh9PH6wDtAablx8mg5VMxYw=;
 b=PeuvFF89AYuBBmjiKzDwc1kABqVNIsj2fYMg8wDBvvRmfmSvEA5IJl+NeBCLaKZa5RARRY
 X8RYTzB+e1BWNORLQDxd1RlmpQNniL+H6gTVoCEagp7q4ngUlodOK1jUmah2NX+K8Qg9LW
 Dvw9Bi631GuYHxM1QFigWuR92rT6zcA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-Hn8jOn--OjuVTSitrUcRYg-1; Tue, 19 Apr 2022 16:31:02 -0400
X-MC-Unique: Hn8jOn--OjuVTSitrUcRYg-1
Received: by mail-qv1-f69.google.com with SMTP id
 30-20020a0c80a1000000b00446218e1bcbso12806091qvb.23
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Apr 2022 13:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=be6VP4VL+z444uHhPHKMJh9PH6wDtAablx8mg5VMxYw=;
 b=NncZjGIQ/95/VISzuJBQDrWEXwI0IA89nLnQLIe6vKEAEvthWnMAMlq+u6SmPdBs8s
 qXiRcn/Eb36WfK8PO95hEYh2pSnfXeZeszWxO+tEDORcIVGAhXMP8qMnqzS3snBxANTk
 whzIBXWVfQQjKjhv+ozBVbxnPvVtrKwJyoZ9yExzytcWdnLa9ATp5SgIvVuxetGOqO+M
 wpAjSWjs1qP+R5AWtOT+IgIUC0H7lxLBzCepM/6aAizK8AWdMwgplIrc1Hs7+xbH34jo
 QW0B5W+YaAwUZLZCZ0he8wvQ/GbamSJQtBxDv7evioQosytvvbZ7ipd0qdH1iGVKt6n4
 55JQ==
X-Gm-Message-State: AOAM533wvxRa1NqgNT2xYBk6zz0ZwBaoks1xCIwzK/8PoCgQ/b8haisE
 Tlahq98WWa/GCnZvBF7ZxzwQ8VhSs3LU650WJjvrDi9HKuMD3TcbwXe0i+C/2YXXuqJky7Sq9bY
 rJGiJ/vUXuSNYD3l/GSuqpcbbcQ==
X-Received: by 2002:a37:510:0:b0:69e:8868:c691 with SMTP id
 16-20020a370510000000b0069e8868c691mr8634586qkf.731.1650400261758; 
 Tue, 19 Apr 2022 13:31:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/S5ftop0ghBWPqC6VcdbCKk2EHMRpvcn+OOjAta4APIO+s/kcOllMhR+W7PX4+MaicfOv5Q==
X-Received: by 2002:a37:510:0:b0:69e:8868:c691 with SMTP id
 16-20020a370510000000b0069e8868c691mr8634569qkf.731.1650400261514; 
 Tue, 19 Apr 2022 13:31:01 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05622a105000b002ed4688f116sm612817qte.86.2022.04.19.13.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 13:31:00 -0700 (PDT)
Message-ID: <55713be81efe8d2b9d19f6e4ad8d64a88087289f.camel@redhat.com>
Subject: 2022 X.Org Foundation Election vote results
From: Lyude Paul <lyude@redhat.com>
To: elections@foundation.x.org, events@lists.x.org, 
 xorg-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, libre-soc-dev@lists.libre-soc.org, 
 members@x.org
Date: Tue, 19 Apr 2022 16:30:59 -0400
In-Reply-To: <b75862cc1cb0a05b02c9249bb4858e8d9013be30.camel@redhat.com>
References: <b75862cc1cb0a05b02c9249bb4858e8d9013be30.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

The Board of Directors election and the vote on the By-laws concluded at
23:59 UTC on 18 April 2022. There are 80 current Members of the X.Org
Foundation, and 52 Members cast votes. This is a 65.0% turn out.

In the election of the Directors to the Board of the X.Org Foundation,
the results were that Emma Anholt, Alyssa Rosenzweig, Mark Filion and
Ricardo Garcia were elected for two year terms.

The old full board is: Emma Anholt, Samuel Iglesias Gonsálvez, Mark
Filion, Manasi D Navare, Keith Packard, Lyude Paul, Daniel Vetter, Harry
Wentland

The new full board is: Emma Anholt, Samuel Iglesias Gonsálvez, Mark
Filion, Manasi D Navare, Alyssa Rosenzweig, Lyude Paul, Daniel Vetter,
and Ricardo Garcia

The full election results were as follows:

           Option | Rank 1 | Rank 2 | Rank 3 | Rank 4 | Rank 5 | Rank 6 | Final Score
      Emma Anholt |     21 |     16 |      4 |      1 |      5 |      5 |         240
Alyssa Rosenzweig |      4 |     10 |     17 |      7 |     11 |      3 |         188
      Mark Filion |      8 |     12 |      7 |     10 |      5 |     10 |         186
   Ricardo Garcia |      9 |      4 |      5 |     17 |     10 |      7 |         172
      Lucas Stach |      4 |      5 |     14 |      9 |     11 |      9 |         163
  Shashank Sharma |      6 |      5 |      5 |      8 |     10 |     18 |         143

Lyude Paul, on behalf of the X.Org elections committee

