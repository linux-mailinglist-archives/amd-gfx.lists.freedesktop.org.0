Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 900744988F4
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jan 2022 19:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3B410E890;
	Mon, 24 Jan 2022 18:52:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400C010E672
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jan 2022 18:52:00 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso7620761ott.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jan 2022 10:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r9ORcgxwPP4ycG1Uxe8mTwFvOudbcps3q5Aj2rRnpck=;
 b=e0jdHKVOQgUpteOMfqGIsKj6bppWqqtxb5ZahWfm3lk77uMULiAbyRMiAKafk9wKhT
 obaUU1owPGL5j6q0WlyHQe9AZXD63iBfKn5yQBktSaUkSZYotefpB1vQhY2MmOd20UBa
 fdBk/sNOEbcRNXpK/Co7No3CejVyF+9fEZtBPov/vxP85W1L74LxnkeMRUb11+lGqngi
 KbyoW40hJ9R+ETAV8kSKkfrsiXWCw57UPUGDO88HRIlqTpbTn5NCBbuFoyhnfHe2+k+i
 GhAQO4/ddpnm1G0bgPsxgqM79TPbDXHjC18GDBxasAnV+4V0d2cXD4/AM/CNIFipJ34V
 Fudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r9ORcgxwPP4ycG1Uxe8mTwFvOudbcps3q5Aj2rRnpck=;
 b=dzgWoP4CbkXJqv+71MOOOZ0mXP+fbOpfliA+ZUTMdG15wFnSGT4eh1fh39LzaOykaQ
 3DZIDYFuD/q7RIBg4Fqagg3/iUEqPMvl8QAXMIcvcvurHYMnyBXaveO+zQ+VM5bbGzHV
 SEz1xwTDWU81Rj4oUPegKx4mDMYV8nY+h4AXuT62/4Fge6or+DO+OkdA3lQzdYUeic3a
 xGWfxaxNVjrxWxiK6kiQ63yxAkVbCHW/gLLadZrOiwJ8ASblBtohNRZZAouQKj7rEdPi
 34p68Ka/fhwRDWGr7lzYXqXhGlfULX5mK0Bq+rKLKv8nBs2c4G/ibFk5NrlP7+QJWM9G
 NLFg==
X-Gm-Message-State: AOAM530XWrrsUeUTKCcekuvzGIPrelkUfTIlMgV8aE082SxldcXWwjI0
 XcKaa7XzLIUqty28aoAu7XNR2sbOg27o+s2zyLU=
X-Google-Smtp-Source: ABdhPJz1Khf3SO0+bH9fYxpAMD7XCc9wWdnY55JgNJ7kmV9RJ/cvxr18HoDYHDiBJbnuymI0c1uy0F3r7GxxZrlfypU=
X-Received: by 2002:a9d:601a:: with SMTP id h26mr3092033otj.357.1643050319496; 
 Mon, 24 Jan 2022 10:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20220123125737.2658758-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 13:51:48 -0500
Message-ID: <CADnq5_MUq0fX7wMLJyUUxxa+2xoRinonL-TzD8tUhXALRfY8-A@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.17-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Network Development <netdev@vger.kernel.org>, linux-um@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, sparclinux@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Tobin C. Harding" <me@tobin.cc>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 5:25 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> On Sun, 23 Jan 2022, Geert Uytterhoeven wrote:
> > Below is the list of build error/warning regressions/improvements in
> > v5.17-rc1[1] compared to v5.16[2].
> >
> > Summarized:
> >  - build errors: +17/-2
> >  - build warnings: +23/-25
> >
> > Note that there may be false regressions, as some logs are incomplete.
> > Still, they're build errors/warnings.
> >
> > Happy fixing! ;-)
> >
> > Thanks to the linux-next team for providing the build service.
> >
> > [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e783362eb54cd=
99b2cac8b3a9aeac942e6f6ac07/ (all 99 configs)
> > [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/df0cc57e057f1=
8e44dac8e6c18aba47ab53202f9/ (98 out of 99 configs)
> >
> >
> > *** ERRORS ***
> >
> > 17 error regressions:
> >  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit declar=
ation of function 'nmi_cpu_backtrace' [-Werror=3Dimplicit-function-declarat=
ion]:  =3D> 171:2
> >  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit declar=
ation of function 'nmi_trigger_cpumask_backtrace' [-Werror=3Dimplicit-funct=
ion-declaration]:  =3D> 226:2
>
> powerpc-gcc5/skiroot_defconfig
>
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(long unsigned int)' to 'void (*)(long unsigne=
d int,  long unsigned int,  long unsigned int,  long unsigned int,  long un=
signed int)' [-Werror=3Dcast-function-type]:  =3D> 1756:13, 1639:13
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct mm_struct *)' to 'void (*)(long unsign=
ed int,  long unsigned int,  long unsigned int,  long unsigned int,  long u=
nsigned int)' [-Werror=3Dcast-function-type]:  =3D> 1674:29, 1662:29
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct mm_struct *, long unsigned int)' to 'v=
oid (*)(long unsigned int,  long unsigned int,  long unsigned int,  long un=
signed int,  long unsigned int)' [-Werror=3Dcast-function-type]:  =3D> 1767=
:21
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct vm_area_struct *, long unsigned int)' =
to 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  lo=
ng unsigned int,  long unsigned int)' [-Werror=3Dcast-function-type]:  =3D>=
 1741:29, 1726:29
> >  + /kisskb/src/arch/sparc/mm/srmmu.c: error: cast between incompatible =
function types from 'void (*)(struct vm_area_struct *, long unsigned int,  =
long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  lo=
ng unsigned int,  long unsigned int,  long unsigned int)' [-Werror=3Dcast-f=
unction-type]:  =3D> 1694:29, 1711:29
>
> sparc64-gcc11/sparc-allmodconfig
>
> >  + /kisskb/src/arch/um/include/asm/processor-generic.h: error: called o=
bject is not a function or function pointer:  =3D> 103:18
> >  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: assignment make=
s pointer from integer without a cast [-Werror=3Dint-conversion]:  =3D> 324=
:9, 317:9
> >  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit declar=
ation of function 'ioport_map' [-Werror=3Dimplicit-function-declaration]:  =
=3D> 317:11
> >  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit declar=
ation of function 'ioport_unmap' [-Werror=3Dimplicit-function-declaration]:=
  =3D> 338:15
>
> um-x86_64/um-allyesconfig
>
> >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: err=
or: control reaches end of non-void function [-Werror=3Dreturn-type]:  =3D>=
 1560:1

I don't really see what's going on here:

#ifdef CONFIG_X86_64
return cpu_data(first_cpu_of_numa_node).apicid;
#else
return first_cpu_of_numa_node;
#endif

Alex

>
> um-x86_64/um-all{mod,yes}config
>
> >  + /kisskb/src/drivers/net/ethernet/freescale/fec_mpc52xx.c: error: pas=
sing argument 2 of 'mpc52xx_fec_set_paddr' discards 'const' qualifier from =
pointer target type [-Werror=3Ddiscarded-qualifiers]:  =3D> 659:29
>
> powerpc-gcc5/ppc32_allmodconfig
>
> >  + /kisskb/src/drivers/pinctrl/pinctrl-thunderbay.c: error: assignment =
discards 'const' qualifier from pointer target type [-Werror=3Ddiscarded-qu=
alifiers]:  =3D> 815:8, 815:29
>
> arm64-gcc5.4/arm64-allmodconfig
> arm64-gcc8/arm64-allmodconfig
>
> >  + /kisskb/src/lib/test_printf.c: error: "PTR" redefined [-Werror]:  =
=3D> 247:0, 247
> >  + /kisskb/src/sound/pci/ca0106/ca0106.h: error: "PTR" redefined [-Werr=
or]:  =3D> 62, 62:0
>
> mips-gcc8/mips-allmodconfig
> mipsel/mips-allmodconfig
>
> >  + error: arch/powerpc/kvm/book3s_64_entry.o: relocation truncated to f=
it: R_PPC64_REL14 (stub) against symbol `machine_check_common' defined in .=
text section in arch/powerpc/kernel/head_64.o:  =3D> (.text+0x3e4)
>
> powerpc-gcc5/powerpc-allyesconfig
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds
