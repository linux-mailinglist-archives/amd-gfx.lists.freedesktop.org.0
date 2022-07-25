Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65157FF94
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Jul 2022 15:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11763B1F16;
	Mon, 25 Jul 2022 13:09:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2268A6C63
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Jul 2022 12:25:27 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LrzlP5kY6z4x1V;
 Mon, 25 Jul 2022 22:25:20 +1000 (AEST)
From: Michael Ellerman <michael@ellerman.id.au>
To: Dan =?utf-8?Q?Hor=C3=A1k?= <dan@danny.cz>
Subject: Re: [PATCH] amdgpu: re-enable DCN for ppc64le
In-Reply-To: <20220722145453.eb37bd3a99c4b738ed2e26b9@danny.cz>
References: <20220722082122.571974-1-dan@danny.cz>
 <87o7xhcoqh.fsf@mpe.ellerman.id.au>
 <20220722145453.eb37bd3a99c4b738ed2e26b9@danny.cz>
Date: Mon, 25 Jul 2022 22:25:19 +1000
Message-ID: <87pmhtbcr4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 25 Jul 2022 13:09:24 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexdeucher@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dan Hor=C3=A1k <dan@danny.cz> writes:
> On Fri, 22 Jul 2022 22:32:06 +1000
> Michael Ellerman <michael@ellerman.id.au> wrote:
>> Dan Hor=C3=A1k <dan@danny.cz> writes:
>> > Commit d11219ad53dc disabled the DCN driver for all platforms that
>> > define PPC64 due long build issues during "make allmodconfig" using
>> > cross-compilation. Cross-compilation defaults to the ppc64_defconfig
>> > and thus big-endian toolchain configuration. The ppc64le platform uses=
 a
>> > different ABI and doesn't suffer from the build issues.
>>=20
>> Unfortunately it's a bit messier than that.
>>=20
>> The build error occurs when the compiler is built to use a 64-bit long
>> double type.
>>=20
>> The ppc64le ABI document says that long double should be 128-bits, but
>> there are ppc64le compilers out there that are configured to use 64-bit
>> long double, notably the kernel.org crosstool compilers.
>>=20
>> So just testing for CPU_LITTLE_ENDIAN means we'll still get build errors
>> on those compilers.
>>=20
>> But I think we can detect the long double size and key off that. Can you
>> test the patch below works for you?
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 7aa12e88c580..e9f8cd50af99 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -281,6 +281,9 @@ config PPC
>>  	# Please keep this list sorted alphabetically.
>>  	#
>>=20=20
>> +config PCC_LONG_DOUBLE_128
>> +	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -=
P -)" =3D 1)
>
> ^^^ there is a typo s/PCC/PPC/ :-)

Oops, renamed it after testing :}

> with that fixed, it then defines AMD_DC_DCN on Fedora 36 with
> gcc-12.1.1-1.fc36.ppc64le and we should be OK.

Thanks. I'll send a proper patch.

cheers
