Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3852CF05
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 20:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8596E049;
	Tue, 28 May 2019 18:58:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA306E049
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 18:58:07 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id r19so8416617uap.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 11:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q5FUIIyIG/0kYxdJLwvb4Tn9IP6XuPLN30cwZcfV96M=;
 b=Sx6FOqmqeIj+pVunW/7hBfNBwwzAb3H/Ht/nny5RF6mcK2h7NTkS9yQBHxJQPRC/Mo
 He7L0Y9ZoCKohXqy1NftMIZXy+ey6Veii8f+l8ndliavBEih5pQ7LsALncaea3fOD0Wd
 UVeXEm74HUt+Pp1DUpdWioBXzK1PkvC/8Glw0ckoUM31FG491XgxvS+MB3XLFoONSZb/
 VkZkrxXfx5Ptadotaa+HFG+HIwJpJJP8VSI8zFPYW1N7YohN8JdtZutTaR59lHZhGajg
 ob/2YujZDD7y0Y7HppoHfgMICBAciwNo6qh4sqj5h+2uZU6Z4QvbAL+6EAPT0Dqf/hQ2
 UnUw==
X-Gm-Message-State: APjAAAWSH3O07exYgU3E8pvoKZz1fV5FaKf3yfpbVrZOu9FOhWzXukuU
 53Y6pXtgK3ScTzHVRHVcTrA=
X-Google-Smtp-Source: APXvYqyzIp+9V0GCnMFbyFIWbdXgxE6d38Ijb1ZUnD+N/Zsf3vRAEWz9VOM/NuvbnpIfmagxPiJwDQ==
X-Received: by 2002:ab0:2395:: with SMTP id b21mr6528154uan.108.1559069886863; 
 Tue, 28 May 2019 11:58:06 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::3:d74f])
 by smtp.gmail.com with ESMTPSA id d5sm9124705vka.34.2019.05.28.11.58.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 11:58:05 -0700 (PDT)
Date: Tue, 28 May 2019 11:58:04 -0700
From: Tejun Heo <tj@kernel.org>
To: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Subject: Re: [PATCH v2 0/4] AMDKFD (AMD GPU compute) support for device cgroup.
Message-ID: <20190528185804.GL374014@devbig004.ftw2.facebook.com>
References: <20190517161435.14121-1-Harish.Kasiviswanathan@amd.com>
 <20190517164937.GF374014@devbig004.ftw2.facebook.com>
 <BYAPR12MB3384A590739D7E18B736CB368C0B0@BYAPR12MB3384.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR12MB3384A590739D7E18B736CB368C0B0@BYAPR12MB3384.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q5FUIIyIG/0kYxdJLwvb4Tn9IP6XuPLN30cwZcfV96M=;
 b=t5RQ0PeKQ3Lf0uZs1+v6VkeIQNZAI1g50GV0MuQ5SWBbAlMESQVFP3NdID7wfxknWA
 srqzxnF3eROBqMrRzGG+IcsSoE6MHrvY3LVwQIvM6E1YX7VzSrZrRLr0HxdBf5YUMrP1
 4MwU8q4E19mju+RupN9qvqLJZ2olsaPriVJ3+lMpTzUBztcXdkjyLcXlaSDQxmylEVc3
 5H3eo4E6o4GLpAhNSvE2iQSLaomEtYaMZwRR7GaC6C2meEJvrViv+32mn1RMIUdZ2EgB
 ZYjajvJ6xzF4Adyjmyd+4UeLHFfhaJjsckQ4evZV54PQ2QeSXwaADQzR0a9+M0SF0Kjk
 c3/w==
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "guro@fb.com" <guro@fb.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBGcmksIE1heSAxNywgMjAxOSBhdCAwODowNDo0MlBNICswMDAwLCBLYXNpdmlz
d2FuYXRoYW4sIEhhcmlzaCB3cm90ZToKPiAxKS4gRG9jdW1lbnRhdGlvbiBmb3IgdXNlciBvbiBo
b3cgdG8gdXNlIGRldmljZSBjZ3JvdXAgZm9yIGFtZGtmZCBkZXZpY2UuIEkgaGF2ZSBzb21lIG1v
cmUgaW5mb3JtYXRpb24gb24gdGhpcyBpbiBwYXRjaCA0LiAKCkkgc2VlLiAgWWVhaCwgSSBqdXN0
IG1pc3NlZCB0aGF0LgoKVGhhbmtzLgoKLS0gCnRlanVuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
