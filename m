Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFDF58F439
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Aug 2022 00:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE169327A;
	Wed, 10 Aug 2022 22:13:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABC1931C4
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Aug 2022 22:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660169604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2F3QmD0SrLKIJ8LZX9kCYhDOznEePDhSMJ1nhI5zKw=;
 b=TigBFT6d0E2oM7nEUYdIVmk1Y/KdCyf8ux8+maMiWEyh3y62+IEAAESkL4dDgMUVoMCaBA
 KcC9X0Upslg3eX+2uUyXaCNiGOm+De5C2YL/s1fPAkGWrrQx8XLU33WmqLV922nbZPiF/5
 Z4l7LQRyug6cgkwSvLXt2QGXUvru6vo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-i34RnKgmPEufTU0Ng4a3Dg-1; Wed, 10 Aug 2022 18:13:21 -0400
X-MC-Unique: i34RnKgmPEufTU0Ng4a3Dg-1
Received: by mail-qk1-f197.google.com with SMTP id
 u15-20020a05620a0c4f00b006b8b3f41303so13446972qki.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Aug 2022 15:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=e2F3QmD0SrLKIJ8LZX9kCYhDOznEePDhSMJ1nhI5zKw=;
 b=R3W+uVhh+PNvoQozhpkayAqeNNDt8ynb7t14r4xDfO2BpQcjvQtfjqGNYuRS+aMC8V
 YAdL8ibgp456UvQVczTT7z88RtGdCTtY1MOE3jF0j07cCqa8Pi5gkELxU/COGBnRm700
 57JluUv/UCPvH7XkD5veAB7ECK8FVcjBx8nM9xUEWm88v42B+MIeGNF5gjjpQzJ3hJqn
 kZiyxu1z+9MCd0pjnPD3+CaApBJ/XAKq1QYNm7Eo1C4FMJ7lB2ozZdiX/JbHsPJfILqH
 iJC8aLpJer4/cqX6pqwnVHcqV89kmABWZEIhRMgpPnWfiGwh4cdAZSmRST6GOrJMm9fQ
 sHig==
X-Gm-Message-State: ACgBeo1oWEdYTgGEIJ/tm1nEBbsR0KqRrEBIS7fP7NpAKIrE9PRimEju
 368EihPBKtgJlpJAsBl74vGDbvLDCXBjcCxCY6GunCSz2RvejwKLxvz2iF/C2g5S3iW1P7Xk04V
 S2/kVXMpPbvxWPPFt+QgE48DGTA==
X-Received: by 2002:ad4:5f08:0:b0:476:bf01:ffd8 with SMTP id
 fo8-20020ad45f08000000b00476bf01ffd8mr25039818qvb.14.1660169601327; 
 Wed, 10 Aug 2022 15:13:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5N/U457+LKyJIZm5Nt/pvduBY+SmUoBTF6bD0CRA3yXSBptcJbDuSLmXnlIBFmpcZlT5iduQ==
X-Received: by 2002:ad4:5f08:0:b0:476:bf01:ffd8 with SMTP id
 fo8-20020ad45f08000000b00476bf01ffd8mr25039804qvb.14.1660169601042; 
 Wed, 10 Aug 2022 15:13:21 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 br19-20020a05620a461300b006b99975ad62sm750360qkb.48.2022.08.10.15.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 15:13:20 -0700 (PDT)
Message-ID: <ef681a8e89c2f4740141d66dd4a3fcb0ad71ab37.camel@redhat.com>
Subject: Re: [RESEND RFC 15/18] drm/display/dp_mst: Skip releasing payloads
 if last connected port isn't connected
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 18:13:18 -0400
In-Reply-To: <SJ0PR12MB5504B1917F4933F1C696FCACFC659@SJ0PR12MB5504.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-16-lyude@redhat.com>
 <CO6PR12MB54890BFD954BBF578E2ADA67FC819@CO6PR12MB5489.namprd12.prod.outlook.com>
 <31d47373883e9aabe5bfa7b172e21b84cc6a164d.camel@redhat.com>
 <SJ0PR12MB5504B1917F4933F1C696FCACFC659@SJ0PR12MB5504.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Imre Deak <imre.deak@intel.com>, open list <linux-kernel@vger.kernel.org>,
 "Lakha, 
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, 2022-08-10 at 03:28 +0000, Lin, Wayne wrote:
> Hi Lyude,
> Thanks for your time and sorry for late response!
> 
> It's described in 5.6.1.3 of DP spec 2.0: 
> "MST branch device, in addition to waiting for the ACK from its immediate 
> Upstream device, should either wait for the ALLOCATE_PAYLOAD message
> transaction with a PBN value equal to 0 from the MST Source device for 
> de-allocating the time slot assigned to the VC Payload that is routed to the
> unplugged DFP or for 2 seconds, whichever occurs first."

oooh! Thank you for posting this, I totally missed the bit that says "or for 2
seconds, whichever occurs first." That certainly explains a lot.

> 
> > > commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
> > > ports in stale topology") was trying to skip updating payload for a
> > > target which is no longer existing in the current topology rooted at
> > > mgr->mst_primary. I passed "mgr->mst_primary" to
> > > drm_dp_mst_port_downstream_of_branch() previously.
> > > Sorry, I might not fully understand the issue you've seen. Could you
> > > elaborate on this more please?
> > > 
> > > Thanks!
> > 
> > I will have to double check this since it's been a month, but basically - the idea
> > of having the topology references in the first place was to be the one check
> > for figuring out whether something's in a topology or not. I've been thinking
> > of maybe trying to replace it at some point, but I think we'd want to do it all
> > over the helpers instead of just in certain spots.
> > 
> > The other thing I noticed was that when I was rewriting this code, I noticed it
> > seemed a lot like we had misunderstood the issue that was causing leaks in
> > the first place. The BAD_PARAM we noticed indicates the payload we're
> > trying to remove on the other end doesn't exist anymore, meaning the
> > branch device in question got rid of any payloads it had active in response to
> > the CSN. In testing though I found that payloads would be automatically
> > released in situations where the last reachable port was marked as
> > disconnected via a previous CSN, but was still reachable otherwise, and not in
> > any other situation. This also seemed to match up with the excerpts in the DP
> > spec that I found, so I assumed it was probably correct.
> 
> IMHO, the main root cause with the commit 3769e4c0af5b ("drm/dp_mst: Avoid
>  to mess up payload table by ports in stale topology") is like what described in the
> commit message. The problem I encountered was when I unplugged the primary
> mst branch device from the system, upper layer didn't try to  release stale streams
> immediately. Instead, it started to gradually release stale streams when I plugged the
> mst hub back to the system. In that case, if we didn't do the check to see whether
> the current request for deallocating payload is for this time topology instance, 
> i.e. might be for the stale topology before I unplug, this deallocation will mess up
> payload allocation for new topology instance.
> 
> As for the CSN, it's a node broadcast request message and not a path message.
> Referring to 2.14.6.1 of DP 2.0 spec: 
> "If the broadcast message is a node request, only the end devices, DP MST
> Source or Sink devices (or DP MST Branch device if Source/Sink are not plugged),
> process the request."
> IMHO, payload should be controlled by source only, by ALLOCATE_PAYLOAD or
> CLEAR_PAYLAOD_ID_TABLE message.
> 
> > 
> > Also, I think using the DDPS field instead of trying to traverse the topology
> > state (which might not have been fully updated yet in response to CSNs)
> > might be a slightly better idea since DDPS may end up being updated before
> > the port has been removed from our in-memory topology, which is kind of
> 
> Thank you Lyude! Just want to confirm with you the below idea to see if I
> understand it correctly. 
> The flow I thought would be (from Source perspective):
> Receive CSN for notifying disconnection event => update physical topology
> connection status (e.g. DDPS, put topology krefcount..) => send hotplug event to
> userspace => userspace asks deallocating payloads for disconnected stream
> sinks =>  put malloc krefcount of disconnected ports/mstbs  => remove ports/mstb
> from in-memory topology.
> I suppose physical topology connection status is updated before sending hotplug
> event to userspace and the in-memory topology still can be referred for stale 
> connection status before payload deallocation completes, i.e. which will put 
> malloc krefcount to eventually destroy disconnected devices in topology in-memory.
> I mean, ideally, sounds like the topology in-memory should be reliable when
> we send ALLOCATE_PAYLOAD as PBN=0. But I understand it definitely is not the
> case if we have krefcount leak.

mhm, I think you made me realize I'm overthinking this a bit now that I've
seen the excerpt you mentioned above, along with the other excerpt about only
the end devices being involved. The main reason I originally foresaw an issue
with this is because the delay with updating the in-memory topology structure
might put us slightly out of sync with the state of the hub on the other end -
causing the hub to spit out an error.

However - based on the excerpts you mentioned I think what I was seeing was
mainly just the 2 second timeout causing things to be released properly - not
specific behavior based on the location in the topology of the branch that was
just unplugged like I originally assumed. I think in that case it probably
does make more sense to go with your fix, so I'll likely drop this and rework
the topology checks you had into this.

> 
> Appreciate for your time and help Lyude!
> 

no, thank you for your help! :) There aren't a whole ton of people who are
this involved with MST so it's very useful to finally have another pair of
eyes looking at all of this. 

>   

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

