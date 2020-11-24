Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC462C2573
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Nov 2020 13:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9C6E222;
	Tue, 24 Nov 2020 12:15:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474B76E222;
 Tue, 24 Nov 2020 12:15:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4767AC2D;
 Tue, 24 Nov 2020 12:15:05 +0000 (UTC)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
 <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
 <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
 <6319ba4d-f45f-77ec-8752-33f3cad443fd@amd.com>
 <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
Message-ID: <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
Date: Tue, 24 Nov 2020 13:15:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2109080509=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2109080509==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Zy5M0hwiX49iheeyapLlQDWdTyywD8qHZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Zy5M0hwiX49iheeyapLlQDWdTyywD8qHZ
Content-Type: multipart/mixed; boundary="0DpKn0NqemPjmhLH9Y8FNWCtpCd9PUizO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
 <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
 <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
 <6319ba4d-f45f-77ec-8752-33f3cad443fd@amd.com>
 <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
In-Reply-To: <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>

--0DpKn0NqemPjmhLH9Y8FNWCtpCd9PUizO
Content-Type: multipart/mixed;
 boundary="------------0B4FF88D5F2DA040C09325C5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0B4FF88D5F2DA040C09325C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.11.20 um 12:54 schrieb Christian K=C3=B6nig:
> Am 24.11.20 um 12:44 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 24.11.20 um 12:30 schrieb Christian K=C3=B6nig:
>>> Am 24.11.20 um 10:16 schrieb Thomas Zimmermann:
>>>> Hi Christian
>>>>
>>>> Am 16.11.20 um 12:28 schrieb Christian K=C3=B6nig:
>>>>> Am 13.11.20 um 08:59 schrieb Thomas Zimmermann:
>>>>>> Hi Christian
>>>>>>
>>>>>> Am 12.11.20 um 18:16 schrieb Christian K=C3=B6nig:
>>>>>>> Am 12.11.20 um 14:21 schrieb Thomas Zimmermann:
>>>>>>>> In order to avoid eviction of vmap'ed buffers, pin them in their=
=20
>>>>>>>> GEM
>>>>>>>> object's vmap implementation. Unpin them in the vunmap=20
>>>>>>>> implementation.
>>>>>>>> This is needed to make generic fbdev support work reliably.=20
>>>>>>>> Without,
>>>>>>>> the buffer object could be evicted while fbdev flushed its=20
>>>>>>>> shadow buffer.
>>>>>>>>
>>>>>>>> In difference to the PRIME pin/unpin functions, the vmap code=20
>>>>>>>> does not
>>>>>>>> modify the BOs prime_shared_count, so a vmap-pinned BO does not =

>>>>>>>> count as
>>>>>>>> shared.
>>>>>>>>
>>>>>>>> The actual pin location is not important as the vmap call return=
s
>>>>>>>> information on how to access the buffer. Callers that require a
>>>>>>>> specific location should explicitly pin the BO before vmapping i=
t.
>>>>>>> Well is the buffer supposed to be scanned out?
>>>>>> No, not by the fbdev helper.
>>>>>
>>>>> Ok in this case that should work.
>>>>>
>>>>>>> If yes then the pin location is actually rather important since t=
he
>>>>>>> hardware can only scan out from VRAM.
>>>>>> For relocatable BOs, fbdev uses a shadow buffer that makes all any=

>>>>>> relocation transparent to userspace. It flushes the shadow fb into=
=20
>>>>>> the
>>>>>> BO's memory if there are updates. The code is in
>>>>>> drm_fb_helper_dirty_work(). [1] During the flush operation, the vm=
ap
>>>>>> call now pins the BO to wherever it is. The actual location does n=
ot
>>>>>> matter. It's vunmap'ed immediately afterwards.
>>>>>
>>>>> The problem is what happens when it is prepared for scanout, but=20
>>>>> can't be moved to VRAM because it is vmapped?
>>>>>
>>>>> When the shadow is never scanned out that isn't a problem, but we=20
>>>>> need to keep that in mind.
>>>>>
>>>>
>>>> I'd like ask for your suggestions before sending an update for this =

>>>> patch.
>>>>
>>>> After the discussion about locking in fbdev, [1] I intended to=20
>>>> replace the pin call with code that acquires the reservation lock.
>>>
>>> Yeah, that sounds like a good idea to me as well.
>>>
>>>> First I wanted to put this into drm_gem_ttm_vmap/vunmap(), but then =

>>>> wondered why ttm_bo_vmap() doe not acquire the lock internally? I'd =

>>>> expect that vmap/vunmap are close together and do not overlap for=20
>>>> the same BO.=20
>>>
>>> We have use cases like the following during command submission:
>>>
>>> 1. lock
>>> 2. map
>>> 3. copy parts of the BO content somewhere else or patch it with=20
>>> additional information
>>> 4. unmap
>>> 5. submit BO to the hardware
>>> 6. add hardware fence to the BO to make sure it doesn't move
>>> 7. unlock
>>>
>>> That use case won't be possible with vmap/vunmap if we move the=20
>>> lock/unlock into it and I hope to replace the kmap/kunmap functions=20
>>> with them in the near term.
>>>
>>>> Otherwise, acquiring the reservation lock would require another=20
>>>> ref-counting variable or per-driver code.
>>>
>>> Hui, why that? Just put this into drm_gem_ttm_vmap/vunmap() helper as=
=20
>>> you initially planned.
>>
>> Given your example above, step one would acquire the lock, and step=20
>> two would also acquire the lock as part of the vmap implementation.=20
>> Wouldn't this fail (At least during unmap or unlock steps) ?
>=20
> Oh, so you want to nest them? No, that is a rather bad no-go.

I don't want to nest/overlap them. My question was whether that would be =

required. Apparently not.

While the console's BO is being set for scanout, it's protected from=20
movement via the pin/unpin implementation, right? The driver does not=20
acquire the resv lock for longer periods. I'm asking because this would=20
prevent any console-buffer updates while the console is being displayed.

>=20
> You need to make sure that the lock is only taken from the FB path whic=
h=20
> wants to vmap the object.
>=20
> Why don't you lock the GEM object from the caller in the generic FB=20
> implementation?

With the current blitter code, it breaks abstraction. if vmap/vunmap=20
hold the lock implicitly, things would be easier.

Sorry for the noob questions. I'm still trying to understand the=20
implications of acquiring these locks.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1] https://patchwork.freedesktop.org/patch/401088/?series=3D83918&r=
ev=3D1
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> For dma-buf sharing, the regular procedure of pin + vmap still app=
ly.
>>>>>> This should always move the BO into GTT-managed memory.
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>> [1]
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.gi=
t%2Ftree%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_fb_helper.c%23n432&amp;data=3D04%7C0=
1%7Cchristian.koenig%40amd.com%7C31b890664ca7429fc45808d887aa0842%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637408511650629569%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;sdata=3DRLauuAuXkcl0rXwWWJ%2FrKP%2BsCr2wAzU1ejGV1bnQ80w%3D&a=
mp;reserved=3D0=20
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>> ---
>>>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/radeon/radeon_gem.c | 51=20
>>>>>>>> +++++++++++++++++++++++++++--
>>>>>>>> =C2=A0=C2=A0 1 file changed, 49 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> index d2876ce3bc9e..eaf7fc9a7b07 100644
>>>>>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>>> @@ -226,6 +226,53 @@ static int radeon_gem_handle_lockup(struct
>>>>>>>> radeon_device *rdev, int r)
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>>>>>>>> =C2=A0=C2=A0 }
>>>>>>>> =C2=A0=C2=A0 +static int radeon_gem_object_vmap(struct drm_gem_o=
bject *obj,
>>>>>>>> struct dma_buf_map *map)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 static const uint32_t any_domain =3D RADEON_=
GEM_DOMAIN_VRAM |
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RAD=
EON_GEM_DOMAIN_GTT |
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RAD=
EON_GEM_DOMAIN_CPU;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct radeon_bo *bo =3D gem_to_radeon_bo(ob=
j);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D radeon_bo_reserve(bo, false);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* pin buffer at its current location */
>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D radeon_bo_pin(bo, any_domain, NULL);=

>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_radeon_bo_u=
nreserve;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_ttm_vmap(obj, map);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_radeon_bo_u=
npin;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unreserve(bo);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +
>>>>>>>> +err_radeon_bo_unpin:
>>>>>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unpin(bo);
>>>>>>>> +err_radeon_bo_unreserve:
>>>>>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unreserve(bo);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static void radeon_gem_object_vunmap(struct drm_gem_object *obj=
,
>>>>>>>> struct dma_buf_map *map)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct radeon_bo *bo =3D gem_to_radeon_bo(ob=
j);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D radeon_bo_reserve(bo, false);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 drm_gem_ttm_vunmap(obj, map);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unpin(bo);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unreserve(bo);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> =C2=A0=C2=A0 static const struct drm_gem_object_funcs=20
>>>>>>>> radeon_gem_object_funcs =3D {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .free =3D radeon_gem_object=
_free,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .open =3D radeon_gem_object=
_open,
>>>>>>>> @@ -234,8 +281,8 @@ static const struct drm_gem_object_funcs
>>>>>>>> radeon_gem_object_funcs =3D {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pin =3D radeon_gem_prime_p=
in,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .unpin =3D radeon_gem_prime=
_unpin,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .get_sg_table =3D radeon_ge=
m_prime_get_sg_table,
>>>>>>>> -=C2=A0=C2=A0=C2=A0 .vmap =3D drm_gem_ttm_vmap,
>>>>>>>> -=C2=A0=C2=A0=C2=A0 .vunmap =3D drm_gem_ttm_vunmap,
>>>>>>>> +=C2=A0=C2=A0=C2=A0 .vmap =3D radeon_gem_object_vmap,
>>>>>>>> +=C2=A0=C2=A0=C2=A0 .vunmap =3D radeon_gem_object_vunmap,
>>>>>>>> =C2=A0=C2=A0 };
>>>>>>>> =C2=A0=C2=A0 =C2=A0 /*
>>>>>>> _______________________________________________
>>>>>>> dri-devel mailing list
>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7=
C01%7Cchristian.koenig%40amd.com%7C31b890664ca7429fc45808d887aa0842%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637408511650629569%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C1000&amp;sdata=3Dh1U9Po83K7webxsiKpn3ZGFz9Fcg6SRkxtrXWZ1%2B%2FEc%3D=
&amp;reserved=3D0=20
>>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>>
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------0B4FF88D5F2DA040C09325C5
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
87A
TQRbOdLgAQgAxiY/gz9X5PlFjlq3+DutR02wuFa/UA9iuH1FB584Nges1EdQT16ixhtPpcyvJ=
H2F
PxeUY5hHApbCJAGhZIOJMyj9eLb2NSefgFd8janHYNNfBzbYsq0sCBNGM/6ptTrdjTGdA3b1Q=
YNt
iDLIrnUNbcfQh/Zrck2yF4AAr5dz1tqPQsYhzxP26IRYcGcIf5F2GABOdZYYp0N6BRHkGQN8O=
Dk7
8UhLKYkEfHYPKiSW/mDgHOSCpOrCZpjOyXxTFkq9trGrTNt6EN1ryW+EVeh00UwCBMsmUu4Ng=
4Ys
rYDButLdKnQARuSl0kFvjipWUablsClmi4d4n/6f7uvXb6Wp2wARAQABwsB8BBgBCAAmFiEEc=
hf7
rIzpz2NEoWjlaA3BHVMLeiMFAls50uACGwwFCQPCZwAACgkQaA3BHVMLeiOl9wgAifA/k6VwQ=
qiR
OccKINPPg6fLgacdE/Z9cBNBkIrGa7gAljaH2J/D01/ZOMJnoAy8Le2EA3SsUOPnk32XizUKl=
oOj
gn7R+Sse7I1pydPbToJ4lXUTs1ie3FSf4tKJGs53LCfp6uPFGL0RhNUsIdwOEESMqYVl+DgAz=
gZk
xZfWWDT54dt3mgvVqzbxa+8j+4hozJXxFvJei3Wv/xAuVaV1Tc2tMXmntMxTbLdkfaZ/my5Io=
cAy
1sTiMonxkcU6jcaEuCNWsFYcT0lc7TzEqSAP7Dq/zf6eiawS5/oLotiupj+2xm/IRfrM3wK2K=
s90
9a79Vc1FgCX+Vq3uVIjcfbqqscLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojB=
QJf
tOH6AAoJEGgNwR1TC3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6=
Baa
6H7ufXNQtThRyIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3=
T0T
trijKP4ASAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446S=
h8W
n/2DYa8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRai=
tYJ
4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9fOwU0EX7ThE=
wEQ
ANJiTIb/nQ+MPgIBsSfBBhmXrVFUwFveO6DWPZ0M+Y5xBJhvDukosstSgcLCdld4SFF2JnnCo=
yh9
boM2j2Ksd5wNzTzXlo3lEzFRAipftboviUjap0qxoRwy1hBV3Ft1/VyNwwYY7qjGVATQU7cIT=
/zL
gb+Sd0NPQA8r2NvpJq1MnI8nFfA2ZH4diuRtavhEBUzp63SlCYxnyxqT5AQzSQGUpsjSyh1A5=
ezt
j1pwxgnkX7F9ZT0lUBo6zZM6ZBq8Nkyvox46l79QoWMBm9y+/nIXy/uXdT6RaumPjBzVttGmk=
Onm
TlGUJyQAndAE1boib9iWCJ4kIr2ezRKjXJXGuaM1m7hSfdQYWed0j52+nW9qGSNNk1GjYXM8Z=
SWT
agX6O5mfbpzRgBBK/XoE9NWRNAa4V+tUX4/vqqDl0m+O4F2GYs6Eu7WLredRgwjDuMF/VCKvQ=
fr3
yjIt90Zi10cHQw3khdJWmSDKYgenpvsffo4x56biifOh6IxS/whf5/BAx4nx8GyX7JO0DUnUu=
ieC
NfEGRu8QbYBSOkO/vdm4xy7RZwdzlqN8zjCLFOCG346Bnsx3ku2lNtX6qZoajmfD4oO6N0Xds=
2pE
wjufCfJW9sCLdBmqLD5OvsRljyv7vt5w28XSF1tyhQaxIs+8sFJtwfCliduffq56FcFrEXCxs=
LQr
ABEBAAHCwqwEGAEIACAWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCX7ThEwIbAgJACRBoDcEdU=
wt6
I8F0IAQZAQgAHRYhBMZ3Zv36bjFHcGBRaJYfxNxEKL/gBQJftOETAAoJEJYfxNxEKL/gkygQA=
LQH
pXm45ZfMCDx7u/d7rRH/R7EfEV5OAoS981IkzbTgrb9z6YYfhQqH+R2ImgoX/Lou7zSjyd22/=
IaZ
AnTKHKkXIFIM1uB144dqAi3tW/Bei/CSdiD7DY1q92Ebl6e+Gpf3TZdATSY00fVeLMNFnjbbz=
CVX
9+LEKYARNm7kYogVJMc5CuVmXBn9FFF3cioRvpuals8llsFc4WiUBJfDfOzjXExqv3OMtJj0s=
qlK
sXdnLkXbtAmEvFaxqUuO1ZwTCTGflrn/g4C8Cg0ifk0wZGgGYRindkJE1vOQZPaDI7GtNxJ+D=
sx4
fL/8tf7Wuk3TZ6t/ofKhjq8sUVCVhnlyd/3ujruDu/PhwwYBsHjNn+PmHeCCRJuOWwKapdfjH=
9nt
sHXTvyXBB2D3H7Oj7S/HOTXRNTUWhaxICKtq+XDSuJKOv7CNevkjMF4ybQDsrUxnaWd76YqNP=
vZv
PYoTqKzKukifjGXMsxC6HU4K2GscpvoaIk7glaD+NYi3fIGi/gR0UNc6cmXtOrYKSnCsNOwcO=
CJL
DjEr6YdbdAXO2wxCLqnupo8JRJgA8hjjHM5OoTGEyP/c+DKDqFO90YilX1XN8xchHrw+bDv0E=
Zm0
RZpVdL7WNr7qQE4UhDfuyo4Gis4Z+npzoOL4g3yaQQfK32zZD9iqk9152b7ny2Ke5oFIF5SSa=
EwH
/2tLNBevzgzWuEB6FtqoMT5RjDyx+xBeImRlhnP0EenRh+EP0nmLCAaFiP4tTp1bX54SyByp8=
wcN
7F2+v2Sgdd64w1pdrjT74Zf1xj0NTxEdt5jEaPfl5Vjv3cXiB8ACwPkMIXmkJx3uaGJynl4Os=
irb
nzzviEzvDVpLAxL7Qr6imlKUh92iAoz+XxEDqgMZnJJOTDFdDxEBhv911VzlRraDNdxw4MHMm=
5Nr
5pj4HGYh3PigzNo0KIreB50YqhGOesaC4Q75gv8mLc2Ec5dEq79BVMUOaCmYDShBN9j6JovNs=
WSR
5YP3tXi+jZ+VnyKLft9wo1fh1oYadFEVSHgGsEY=3D
=3DfoRs
-----END PGP PUBLIC KEY BLOCK-----

--------------0B4FF88D5F2DA040C09325C5--

--0DpKn0NqemPjmhLH9Y8FNWCtpCd9PUizO--

--Zy5M0hwiX49iheeyapLlQDWdTyywD8qHZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+8+UgFAwAAAAAACgkQlh/E3EQov+Ak
4g//aEWWEgBKwG7qRgWu5qeoUSTVyE+GZ6H2NQSunl/X9m6mQRQQYMeIaj+5Wk/+YKMhyTMhtwvk
lWppJkx1HFMI34hObn+49Z2Nk/nheC77WQzCDwSQYiIX7k5dkyOe92Zg6DHoy02r7lYivmujYj2V
T4b1LdL4z+AWiUcaeDyswtyDzMOV2CXuSOYKH5nVlTBxYHWFaCwcJPbkVtQ40hUYcN5ASntiUkmL
pVEN1xTpPTlnxJr7+StxcMYrjRpQEUg5aBMXZHjAcc785BUUa46Trl+YUxasuSIGAmDH0Q++Mz3W
7+dufdyiRVyt5Uj58ul/fxBRaZp3zcGIHtmazyO5SQJrtNAs3JbmPiAGiRP2gvl78oU6BNxQW6WS
1R3fWK/7V8SPY4YBeDFIHDP/T4DvjCTOSOZQNUc/MVtUdA1nses1woD9YjLG1adGhWTjGocXWx8G
bbmNlSeW6ZgGMgwdcmDi8iXLDEBK70ACa1gF4Zk6uEIjdKvSRb2wiHt7Mspi4vibrwQqYD2fm+2F
eBd8jtjGrRYdiD4eeFZyiKqDio6m97SbgjK9e8IhVV3dXKniWIdUuhBBMHd6GR9WXeL/wgm7W756
O7ZeEBDgwVTNdyGRx0K9Dl81ot0IsRctzLa9hV6BQT0rN1Ni0IpXrWnX8W5FiVyakEPURsv9uXQa
ZiI=
=ro1I
-----END PGP SIGNATURE-----

--Zy5M0hwiX49iheeyapLlQDWdTyywD8qHZ--

--===============2109080509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============2109080509==--
