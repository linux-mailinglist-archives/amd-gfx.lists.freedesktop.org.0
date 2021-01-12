Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E23EC2F2B1B
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jan 2021 10:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E889A6E190;
	Tue, 12 Jan 2021 09:21:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313FA6E18F
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 09:21:56 +0000 (UTC)
Date: Tue, 12 Jan 2021 09:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1610443313;
 bh=P7Xq0acnLz9yj6KgKO1+MbJIrgeDLzDdM6heYyrfd4o=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=G6eHKKIQ3TPMBPpOa+mw4Is/3/XTksJFFoUGYuAN5O9L48nF1cBBkQZ0xo80JXVf/
 gZSiYPFX4mnqR0mtWg1sb629vK3PCVXJbX1ER9Kv1BCIwIyTMFww+EWVuMPXg+x33k
 JTNAQ9lo2UUQpIPABE93Y8iRGHIO+XBPXCcOxNHEARZZEwr5fJvm1HwRUBUzgBTn/p
 oe3BGpWwRwjrsRcpPKO84g9U70X7nOe8p5T4xZCpBhLcfcTkj/gCHJ6zFAB0p3s1N5
 pBSpu7G93K6/2OCovpRVqMpRN/DS33OXr6YZKpjKyLQnaK2UiauwcUfnBXpNt+/RUW
 Z2RCmT9ehkWrw==
To: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: RE: [PATCH 1/2] drm: distinguish return value of
 drm_dp_check_and_send_link_address.
Message-ID: <fhO3DFK9BjC0oXptdSRyxVqyxYGUM2BV9bgl-IoQa1E8CiTQVz0BbZXGdqawwnkryfbVMeyVIBTYPOpBkOKca34wehM7OAKJOzBtWQo4ovs=@emersion.fr>
In-Reply-To: <DM6PR12MB2602B6281BF8C9430115E03BE3AA0@DM6PR12MB2602.namprd12.prod.outlook.com>
References: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
 <DM6PR12MB2602B6281BF8C9430115E03BE3AA0@DM6PR12MB2602.namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Wentland,
 Harry" <Harry.Wentland@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tuesday, January 12th, 2021 at 7:36 AM, Chen, Xiaogang <Xiaogang.Chen@amd.com> wrote:

> Any comment?
>
> -----Original Message-----
> From: Xiaogang.Chen <xiaogang.chen@amd.com>
> Sent: Monday, January 4, 2021 12:02 AM
> To: amd-gfx@lists.freedesktop.org; Wentland, Harry <Harry.Wentland@amd.com>; dri-devel@lists.freedesktop.org; airlied@linux.ie
> Cc: Chen, Xiaogang <Xiaogang.Chen@amd.com>
> Subject: [PATCH 1/2] drm: distinguish return value of drm_dp_check_and_send_link_address.
>
> From: Xiaogang Chen <xiaogang.chen@amd.com>
>
> drm_dp_check_and_send_link_address discovers MST device topology.
> It can return both positive and negative values. When it returns positive values there is no error found. If it returns negative values there is error found, such as get NAK , timeout, etc. Following drm_kms_helper_hotplug_event should be called when drm_dp_check_and_send_link_address returns positive value.
>
> Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>

To the best of my knowledge, this sounds correct.

Please wrap your commit message into 80-character lines so that it's easier
to read. Regardless, this is:

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
