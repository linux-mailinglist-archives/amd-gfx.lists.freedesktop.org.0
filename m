Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10877FFFD
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Aug 2023 23:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71D10E0A6;
	Thu, 17 Aug 2023 21:38:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D02210E0A6
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Aug 2023 21:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692308292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDluI5ZjwOJ+T5J3wcvpVcYjUnp1Wja3JwRsK7BWrBk=;
 b=IT1eSWCB3wvM82M+XQ5giIqKKO4ycs/dkx1tce+M7Jli0fDEinYNXK3qaHkzc3ucyVDM/b
 tAYhjtf8CpuKj5Fn9gB07PkVSXzmzvfaL4TYy3vMIIC8JkmR+5+ZZhot61VSRJkCgjC0GD
 /OH31XI3JDpO9kqPuSl5tthU3CTUosY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-dl4Sr_WLO8-u5E7BBhGx5g-1; Thu, 17 Aug 2023 17:38:09 -0400
X-MC-Unique: dl4Sr_WLO8-u5E7BBhGx5g-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-40c10c73650so3898231cf.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Aug 2023 14:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692308289; x=1692913089;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eDluI5ZjwOJ+T5J3wcvpVcYjUnp1Wja3JwRsK7BWrBk=;
 b=ap9fUHary7rRhDfJ0EfkUl/qAKIRPmkp+fXZvLFy1Eh6o4uKZjcZvf9KH6cH9Le3Jw
 4Wf187C47/crNmbZqAtGRHxGsvu/1ti5us97f1FtqlMkL7/+86PCMslUVWJ70ZNXHZJE
 RSuSykHFoSmdzMSinac1ncQzdVyQoZe+T/7nvNdmSSbpcLmrjmLCLrGJNVj27EIKjdUA
 pk5c7kxuqmXjOAaumNWPfYwEhCauCnuJ8ze19kiihuvDYDSYkTEWLz6bmV9/C4gkHNCF
 AsLuevV6wUvJZydZYHgmbNZQPBdu7YFalKrxnA8iR86OiCbeOPPBLXTUDdW8HDni4r7M
 w6rA==
X-Gm-Message-State: AOJu0YzY4q2Efv/wXZ429fBqV2tN109hPfSzCU58dYdzZx/uJRr5eQN+
 IqhoMZwaXNiJQLpBhYqGgnDTB5rKPwLHg3lYGhDVWooDnkXnpR5bD2rjeWyfWMXu5lmVoIC6h/5
 uYd9vn9S5ZrETTvieu5OoBYYIfQ==
X-Received: by 2002:a05:622a:22a4:b0:410:443:221a with SMTP id
 ay36-20020a05622a22a400b004100443221amr883565qtb.1.1692308289298; 
 Thu, 17 Aug 2023 14:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEmPQx10wj/WvcpKWC42zSsRb+eziDpifGfLRmEib1iOpWZRLrU9IULFAW46VtsDvI+moSAA==
X-Received: by 2002:a05:622a:22a4:b0:410:443:221a with SMTP id
 ay36-20020a05622a22a400b004100443221amr883549qtb.1.1692308288969; 
 Thu, 17 Aug 2023 14:38:08 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a05620a111a00b00767e2668536sm97797qkk.17.2023.08.17.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 14:38:08 -0700 (PDT)
Message-ID: <e70cc5678d605512e66afab09277bfa4811c2985.camel@redhat.com>
Subject: Re: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com, "Lin, Wayne" <Wayne.Lin@amd.com>
Date: Thu, 17 Aug 2023 17:38:07 -0400
In-Reply-To: <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Wentland,
 Harry" <Harry.Wentland@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 2023-08-07 at 18:59 +0300, Imre Deak wrote:
> On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > [AMD Official Use Only - General]
> >=20
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Friday, August 4, 2023 11:32 PM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.co=
m;
> > > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > <Jerry.Zuo@amd.com>
> > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > drm_dp_remove_payload_part2()
> > >=20
> > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > > [...]
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > index e04f87ff755a..4270178f95f6 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > @@ -3382,8 +3382,7 @@
> > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > >   * drm_dp_remove_payload_part2() - Remove an MST payload locally
> > > >   * @mgr: Manager to use.
> > > >   * @mst_state: The MST atomic state
> > > > - * @old_payload: The payload with its old state
> > > > - * @new_payload: The payload with its latest state
> > > > + * @payload: The payload with its latest state
> > > >   *
> > > >   * Updates the starting time slots of all other payloads which wou=
ld have
> > > been shifted towards
> > > >   * the start of the payload ID table as a result of removing a
> > > > payload. Driver should call this @@ -3392,25 +3391,36 @@
> > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > >   */
> > > >  void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr
> > > *mgr,
> > > >                              struct drm_dp_mst_topology_state
> > > *mst_state,
> > > > -                            const struct drm_dp_mst_atomic_payload
> > > *old_payload,
> > > > -                            struct drm_dp_mst_atomic_payload
> > > *new_payload)
> > > > +                            struct drm_dp_mst_atomic_payload
> > > *payload)
> > > >  {
> > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > +   u8 time_slots_to_remove;
> > > > +   u8 next_payload_vc_start =3D mgr->next_start_slot;
> > > > +
> > > > +   /* Find the current allocated time slot number of the payload *=
/
> > > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > +           if (pos !=3D payload &&
> > > > +               pos->vc_start_slot > payload->vc_start_slot &&
> > > > +               pos->vc_start_slot < next_payload_vc_start)
> > > > +                   next_payload_vc_start =3D pos->vc_start_slot;
> > > > +   }
> > > > +
> > > > +   time_slots_to_remove =3D next_payload_vc_start -
> > > > +payload->vc_start_slot;
> > >=20
> > > Imo, the intuitive way would be to pass the old payload state to this=
 function -
> > > which already contains the required time_slots param - and refactor t=
hings
> > > instead moving vc_start_slot from the payload state to mgr suggested =
by Ville
> > > earlier.
> > >=20
> > > --Imre
> >=20
> > Hi Imre,
> > Thanks for your feedback!
> >=20
> > I understand it's functionally correct. But IMHO, it's still a bit
> > conceptually different between the time slot in old state and the time
> > slot in current payload table. My thought is the time slot at the
> > moment when we are removing the payload would be a better choice.
>=20
> Yes, they are different. The old state contains the time slot the
> payload was added with in a preceding commit and so the time slot value
> which should be used when removing the same payload in the current
> commit.
>=20
> The new state contains a time slot value with which the payload will be
> added in the current commit and can be different than the one in the old
> state if the current commit has changed the payload size (meaning that
> the same atomic commit will first remove the payload using the time slot
> value in the old state and afterwards will add back the same payload
> using the time slot value in the new state).
>=20
> > And with this, we can also simplify some codes. Especially remove
> > workaround in amd driver. In fact, DRM mst code maintains the payload
> > table and all the time slot info is in it already. We don't really
> > have to pass a new parameter.
>=20
> I agree that drm_dp_remove_payload() could be simplified, but this
> should be done so that the drivers can pass the old payload state to it
> (without having to pass the new state). This would be possible if
> vc_start_slot was not tracked in the payload state (which is really not
> an atomic state that can be precomputed as all other atomic state),
> rather it would be tracked in struct drm_dp_mst_topology_mgr.

JFYI too  - I think I'm fine with us moving vc_start_slot elsewhere at this
point ;)

>=20
> It looks like AMD has to reconstruct the old state in
> dm_helpers_construct_old_payload(). Could you explain why it couldn't
> instead just pass old_payload acquired by
>=20
> old_mst_state =3D drm_atomic_get_old_mst_topology_state();
> old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state);
>=20
> ?
>=20
> > > >     /* Remove local payload allocation */
> > > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > -           if (pos !=3D new_payload && pos->vc_start_slot > new_pa=
yload-
> > > > vc_start_slot)
> > > > -                   pos->vc_start_slot -=3D old_payload->time_slots=
;
> > > > +           if (pos !=3D payload && pos->vc_start_slot > payload-
> > > > vc_start_slot)
> > > > +                   pos->vc_start_slot -=3D time_slots_to_remove;
> > > >     }
> > > > -   new_payload->vc_start_slot =3D -1;
> > > > +   payload->vc_start_slot =3D -1;
> > > >=20
> > > >     mgr->payload_count--;
> > > > -   mgr->next_start_slot -=3D old_payload->time_slots;
> > > > +   mgr->next_start_slot -=3D time_slots_to_remove;
> > > >=20
> > > > -   if (new_payload->delete)
> > > > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > > > +   if (payload->delete)
> > > > +           drm_dp_mst_put_port_malloc(payload->port);
> > > >=20
> > > > -   new_payload->payload_allocation_status =3D
> > > DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > +   payload->payload_allocation_status =3D
> > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > >  }
> >=20
> > --
> > Regards,
> > Wayne
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

