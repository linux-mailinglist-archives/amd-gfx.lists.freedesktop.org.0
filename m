Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263FC598FAA
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Aug 2022 23:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DC710F0BE;
	Thu, 18 Aug 2022 21:37:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485F10F0BE
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Aug 2022 21:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660858651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=bNelv68u96csnOjL00mLYGQrOoFqT+wuKLtjfaQPzXM2aU/7MwvvYVOPVQvi9YhXnvw13D
 ZTJO2dRJz02nlxpNu0840G3TDjjql2I7eGWVDHzB774C4xKPF84FJ/Xqg9crW6UJInvYMG
 Nsxn085amJMVDxSDwMHLQmztExH3Y2c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-hTzNrkIkOd-ICDhOhS6bMg-1; Thu, 18 Aug 2022 17:37:30 -0400
X-MC-Unique: hTzNrkIkOd-ICDhOhS6bMg-1
Received: by mail-qt1-f197.google.com with SMTP id
 z6-20020ac875c6000000b0034454b14c91so2096524qtq.15
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Aug 2022 14:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization:date
 :to:from:subject:message-id:x-gm-message-state:from:to:cc;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=wQKmiiQYk7Py1YtiQ0rYBu0j16KpkV/Z0VYQuVZ+oisbKAIz+jEevKJ5Ew2fbJjR1g
 uA7LGi9v/bdHuocOFBzMcKrwelWBkdVt7wz0CdAom+Rx8bSXxn3IvPFNA3UHMQwz2UOf
 ajwbAtC3sDoPYtPeXZ2B3ygoTmsq0UkH6Zk0FuPqvwfCarRCENfnHTMmCQXv1YuTaIAg
 tJ7uS4MOX8//8oo73F+MvGo4glKDSLRL3gp48I6I4a/JhWWgg+KZJXLqdEatnIPinS/e
 gZWsc6IAbRKE44cOjG5lXLNGh6zJNxWr2L8gVn4R7kg6o2jWLO0p9sa4TZ9jlG0FtCiq
 jqmA==
X-Gm-Message-State: ACgBeo3x3K2meKZMEwMRDKXfW85UzVPkpYG/Jb9aUNs2GfucNykIi57E
 SJZLuhL396IdmDeFTHiOd9w7BSGgV3rHgM4hyFrnQ97YWK6zLN+NxmkmSZHaKlza0LyppGXHzIm
 3xC7PI0BU4cxwlkTA9Xxr/WFJY+ddyWsaTv7iULdm6fwtDDJ1sZESGiB/idogt/MI+eUPMC5hJw
 ==
X-Received: by 2002:a05:620a:2b82:b0:6bb:3ded:1bff with SMTP id
 dz2-20020a05620a2b8200b006bb3ded1bffmr3530888qkb.174.1660858649940; 
 Thu, 18 Aug 2022 14:37:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR52/mWS4i/mA2/DXhrjp2Ad98s1ss1sBNyF0zAQnm7ohmf+sanhHf+zcpfIwZQ0XFH8xC41Hw==
X-Received: by 2002:a05:620a:2b82:b0:6bb:3ded:1bff with SMTP id
 dz2-20020a05620a2b8200b006bb3ded1bffmr3530878qkb.174.1660858649646; 
 Thu, 18 Aug 2022 14:37:29 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 bl8-20020a05622a244800b00342fdc4004fsm1780154qtb.52.2022.08.18.14.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 14:37:29 -0700 (PDT)
Message-ID: <273ff2cbd345f5dc5c4fe203fd2474ec23f06fb2.camel@redhat.com>
Subject: Requests For Proposals for hosting XDC 2023 are now open
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Date: Thu, 18 Aug 2022 17:37:28 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2023. Since
XDC 2022 is being held in North America this year, XDC 2023 is expected
to be in Europe. However, the board is open to other locations,
especially if there's an interesting co-location with another
conference.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible
dates along with estimated costs. Proposals can be submitted to board
at foundation.x.org until the deadline of *September 1st, 2022*. 

Additionally, an quirk early heads-up to the board if you're
considering hosting would be appreciated, in case we need to adjust the
schedule a bit. Also, earlier is better since there generally will be a
bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.

Best regards,
	Lyude Paul
On behalf of X.org

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

