Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E711017D5C5
	for <lists+amd-gfx@lfdr.de>; Sun,  8 Mar 2020 20:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F436E083;
	Sun,  8 Mar 2020 19:10:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C36D6E05A
 for <amd-gfx@lists.freedesktop.org>; Sun,  8 Mar 2020 19:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cxmh0d1aEvZPoq8iaYaL1QORwWLLOaylTnbpvvSdYqCYNJPLpNZAe0sjVmhBLstf18hmnTi/+M1CG42LVMeWo1L9QKNC4fn9IpCGa/eiKO2T8kgkHbJEUY5Z4ciIXw9oSYC9K8fiHyG4CTjZ86Y1mHDZOHFJNzWljEDAyYdDSUP8LVNeJE+fr9gWlj9hVhIguuI1m64n3iuaFFeKW6iz1i2FeMYty1b2nEhNwf94Mr9wFzRbnMl46vy1qDwYtu73RBh59wlP1Q7kADOOTP1EOvrYC/qbLrCo77LJ3Jk8/GnXvpNVXYY9TbHWZhM9/Id1VmaMbiOGPLKN5ywO4IXEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbXpuljqxouS/F7vEfV/JiAa5lsv2HCYBOAu33fHnK8=;
 b=dOAawzXFtMJN3bnLsHXJmzTV2tAr+Kiqh3H0KHkJiNk6zW2rMPU2vKJKknJUYJS2077dlRoA0uDemqX5Ou32XjUz8QWE96bhTqE0Ql5P6ASJ6Tkk3iQ4rtDOdtQAsOAesjB7VtPeKwUOeMq9tWrGfkvNdDDvn8QWu776S1x/IJ8bcqm8gKzV0BWFHeTMes4k7xKT/hpurRQxX89hC6vD1Yi1YDRE5O5PSg5Df5m6gpTX3//Kxc+6DM4OtSHG1q0J0hjKv/Rbl8YKXLMJCFwlnyF0lKl2wRMTo1UeB0ALMFR8QbzkhX6c75sK2UvedO0vTkEBOc6kJ8WF+rEBX6UXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbXpuljqxouS/F7vEfV/JiAa5lsv2HCYBOAu33fHnK8=;
 b=tgC4Aq/h8rAUPgD7aJ7euqzKdfKRGPhTan84yynFjH5RycW6ds6lzN6qQo9jHgcPAzGVN27hrtWnDGFwqjF1XdEz2T9qZCrYdrpE+vYP31lpxiVvEAWuBbJIW9jVh6cQsRZGjQUdMVWPVr7a9Qnqw3GrK9AM9vf8G4XjEcaSwGw=
Received: from DM6PR12MB3097.namprd12.prod.outlook.com (2603:10b6:5:11d::25)
 by DM6PR12MB3882.namprd12.prod.outlook.com (2603:10b6:5:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Sun, 8 Mar
 2020 19:10:25 +0000
Received: from DM6PR12MB3097.namprd12.prod.outlook.com
 ([fe80::c90d:ccf4:5717:9b46]) by DM6PR12MB3097.namprd12.prod.outlook.com
 ([fe80::c90d:ccf4:5717:9b46%5]) with mapi id 15.20.2793.013; Sun, 8 Mar 2020
 19:10:25 +0000
From: "Bridgman, John" <John.Bridgman@amd.com>
To: Clemens Eisserer <linuxhippy@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Possibility of RX570 responsible for spontaneous reboots (MCE)
 with Ryzen 3700x?
Thread-Topic: Possibility of RX570 responsible for spontaneous reboots (MCE)
 with Ryzen 3700x?
Thread-Index: AQHV9UqqZR23yGf9cUeTL0ye4URzuKg/BbcggAAGOhM=
Date: Sun, 8 Mar 2020 19:10:25 +0000
Message-ID: <DM6PR12MB309791830A01031827FE2DCAE8E10@DM6PR12MB3097.namprd12.prod.outlook.com>
References: <CAFvQSYQqneGVka+uyZjs1RsFNFkXZqYmz9pTP6=8uhUP0ddHAQ@mail.gmail.com>,
 <DM6PR12MB30977EA10F8FDF64778C18CAE8E10@DM6PR12MB3097.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB30977EA10F8FDF64778C18CAE8E10@DM6PR12MB3097.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-03-08T19:10:24.952Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=John.Bridgman@amd.com; 
x-originating-ip: [72.136.100.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6f2dff38-6d4a-4208-dbcb-08d7c3945b94
x-ms-traffictypediagnostic: DM6PR12MB3882:
x-microsoft-antispam-prvs: <DM6PR12MB3882F71ECEA12F8270D577F6E8E10@DM6PR12MB3882.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03361FCC43
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(199004)(189003)(8936002)(64756008)(53546011)(110136005)(66476007)(66946007)(2906002)(55016002)(9686003)(66556008)(316002)(71200400001)(7696005)(66446008)(6506007)(76116006)(478600001)(2940100002)(19627405001)(5660300002)(52536014)(966005)(186003)(86362001)(81156014)(33656002)(8676002)(81166006)(26005)(45080400002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3882;
 H:DM6PR12MB3097.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H9a00/y3B979Eo+rfuYZtXuLnHBSwgM+YKLIeDtqk7pD7p9pP+k19gOFpHntZlBZ7yuTJkNJZMXDW8HiQpz2kLBLNUsTNhjtMq2/S7bOdLgtvqfRdVSsTyMNoIPIFdETKD4V4C3RQPjYR6/LhcWQvIQw0WCeO2MnIVPMNjKlNs/oFNkbaPcgPfuU3R9QoGGfoWvdgKoxtMEyEtW8PuJo9Jc6g1/yh98cxFS37foc4DHvpnHvxb+4DSqRbfKtdJFzdPfY1JxWIdiC0fSilcNug9zHLc7oD+lz59wccVwx6/GsUZh7bbXStF04nnC2ZPguoxgFSD2pJ4IT+pP7tL3tlvDUX+k9pNlY/+ZBiSMWoYFpUXEaUXYQyBcenecEy27G5yqO//uY42nspP9S2L8kh3DyBOOIK8OWEzQTibY4WQGyGkJ82russulaZTXNHY21dr0fdf6v6E7suJgKRu7aZbv4XBACUaY7LpUhuhcHnRE3zbAGbHGEw18FKaMngyTZImk2fSqR0lm+8dgH1WefkA==
x-ms-exchange-antispam-messagedata: Sl7EguAnrgJF3Ni1OQGnJRfFCvTyfeKVkfeFj9YAlwArWk9TlRvAK2dzMBm3pufxQ5moO1wVYOy4h3moNGOK2WbXjZ7lnwfcBj7q7Zv6TQP2aHhsVp/mQl1KPuCo+ypihbmXUe1Pv7FI0gsjlzbQEQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2dff38-6d4a-4208-dbcb-08d7c3945b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2020 19:10:25.4913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKr9kalRybVCIT+ulco710qEFKZzWgLFLJ9eykA+sdlLMbS3yRFhWzL/ymeM9aMf2SP4SIIOgsntry/v1pOF3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3882
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
Content-Type: multipart/mixed; boundary="===============0093581751=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0093581751==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB309791830A01031827FE2DCAE8E10DM6PR12MB3097namp_"

--_000_DM6PR12MB309791830A01031827FE2DCAE8E10DM6PR12MB3097namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

OK, that's a bit strange... I found mce log and MCE-Ryzen-Decoder as option=
s for decoding.

In MCE-Ryzen-Decoder docco the example is exactly the error you are seeing,=
 with the same output, so guessing that is what you are using:

https://github.com/DimitriFourny/MCE-Ryzen-Decoder

On the other hand I found a report on AMD forums where the same error is de=
coded by mce log as a generic error in a memory transaction, which seems to=
 make more sense.

https://community.amd.com/thread/216084

For something as simple as the GPU bus interface not responding to an acces=
s by the CPU I think you would get a different error (bus error) but not 10=
0% sure about that.

My first thought would be to see if your mobo BIOS has an option to force P=
CIE gen3 instead of 4 and see if that makes a difference. There are some am=
dgpu module parms related to PCIE as well but I'm not sure which ones to re=
commend.

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Bridgman=
, John <John.Bridgman@amd.com>
Sent: March 8, 2020 2:45 PM
To: Clemens Eisserer <linuxhippy@gmail.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Subject: Re: Possibility of RX570 responsible for spontaneous reboots (MCE)=
 with Ryzen 3700x?


[AMD Official Use Only - Internal Distribution Only]

The decoded MCE info doesn't look right... if the last bit is a zero I beli=
eve that means the watchdog timer is not enabled.

That said, I'm not sure how the decoder you found works, but it seems like =
a bit more information would be required than what you passed in. Can you p=
oint me to the program you used ?

Thanks,
John

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Clemens =
Eisserer <linuxhippy@gmail.com>
Sent: March 8, 2020 9:06 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: Possibility of RX570 responsible for spontaneous reboots (MCE) wit=
h Ryzen 3700x?

Hi there,

Right after Ryzen3xxx was available I built a new system consisting of:
- Asrock Phantom Gaming 4 X570 (latest BIOS 2.3)
- Ryzen 3700x (not overclocked)
- MSI RX570 4GB
- Larger CPU cooler, high quality PSU, etc...

The system runs stable with Windows-10 (no reboot BSOD in months) and
runs memtest86 (single/multicore) as well as various load-tests for
hours without errors. However running Linux I get a spontaneous reboot
every now and then (2-3x a week), with always the same machine check
exception logged:

[    0.105003] .... node  #0, CPUs:        #1  #2
[    0.107022] mce: [Hardware Error]: Machine check events logged
[    0.107023] mce: [Hardware Error]: CPU 2: Machine Check: 0 Bank 5:
bea0000000000108
[    0.107092] mce: [Hardware Error]: TSC 0 ADDR 7f80a0c0181a MISC
d012000100000000 SYND 4d000000 IPID 500b000000000
[    0.107167] mce: [Hardware Error]: PROCESSOR 2:870f10 TIME
1580717835 SOCKET 0 APIC 4 microcode 8701013

I've tried a lot of different CPU-related things, like disabling C6,
disabling MWAIT use for task switching, etc without success.
I tried two times to contact AMD support only asking them to please
decode the MCE hex value - but as soon as they read over the term
"linux" the basically abort any communication. And to be honest, I had
the impression that they did not actually know what an MCE is in the
first place.

Luckily I found a decoder on github which prints:
Bank: Execution Unit (EX)
Error: Watchdog Timeout error (WDT 0x0)

I was rather hopeless until I found the following reddit thread:
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.red=
dit.com%2Fr%2Farchlinux%2Fcomments%2Fe33nyg%2Fhard_reboots_with_ryzen_3600x=
%2F&amp;data=3D02%7C01%7Cjohn.bridgman%40amd.com%7C683b51328ba1471c113c08d7=
c3619d90%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637192697111254592&am=
p;sdata=3D4TuB0a0VHxTqd8R0xLwxg%2BOv1vu8C7L%2FLW4O0EOiq1I%3D&amp;reserved=
=3D0<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.reddit.com%2Fr%2Farchlinux%2Fcomments%2Fe33nyg%2Fhard_reboots_with_ryzen_=
3600x%2F&data=3D02%7C01%7Cjohn.bridgman%40amd.com%7Ca20457c9361648485aeb08d=
7c390d88a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637192899911911960&s=
data=3DARxvLcwPrVQkP%2Bil%2FvKz9mKZOBd5Sx%2Bg0MOlQ%2F8UmIs%3D&reserved=3D0>
what the decoder logic is
The users there claim to experience exactly the same problem (even
with the same MCE-Code logged) but where using R600 based graphics
cards - he is even using the same mainboard. When he swapped his
R600-card with a new RX5700 the problems vanished.

I don't have the luxury to simply try another GPU (my RX5700 is the
only one properly driving my 4k@60Hz panel), however the whole
observation makes me wonder. How can a GPU be responsible for
low-level errors such as the machine check exception in the execution
units like the one mentioned above.
Could DMA transfers gone bad be the cluprit?
Are there any "safe mode" options available I could try regarding
amdgpu (I tried disabling low-power states but this didn't help and
only made my GPU fans spin up)?

Any help is highly appreciated.

Thanks, Clemens
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7Cjohn.bri=
dgman%40amd.com%7C683b51328ba1471c113c08d7c3619d90%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637192697111264585&amp;sdata=3DL52zHeIm8GzEr5eYjUDm5bP=
K4U1DF0t1GtaxaUy9qHY%3D&amp;reserved=3D0<https://nam11.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinf=
o%2Famd-gfx&data=3D02%7C01%7Cjohn.bridgman%40amd.com%7Ca20457c9361648485aeb=
08d7c390d88a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63719289991192195=
3&sdata=3DzuBIsSmJqDSR5pg4mcjcYlRypl65g4EJoLhgjzD20rk%3D&reserved=3D0>

--_000_DM6PR12MB309791830A01031827FE2DCAE8E10DM6PR12MB3097namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
OK, that's a bit strange... I found mce log and MCE-Ryzen-Decoder as option=
s for decoding.
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
In MCE-Ryzen-Decoder docco the example is exactly the error you are seeing,=
 with the same output, so guessing that is what you are using:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://github.com/DimitriFourny/MCE-Ryzen-Decoder">https://gith=
ub.com/DimitriFourny/MCE-Ryzen-Decoder</a><br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
On the other hand I found a report on AMD forums where the same error is de=
coded by mce log as a generic error in a memory transaction, which seems to=
 make more sense.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<a href=3D"https://community.amd.com/thread/216084">https://community.amd.c=
om/thread/216084</a><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
For something as simple as the GPU bus interface not responding to an acces=
s by the CPU I think you would get a different error (bus error) but not 10=
0% sure about that.
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
My first thought would be to see if your mobo BIOS has an option to force P=
CIE gen3 instead of 4 and see if that makes a difference. There are some am=
dgpu module parms related to PCIE as well but I'm not sure which ones to re=
commend.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Bridgman, John &lt;John.Bri=
dgman@amd.com&gt;<br>
<b>Sent:</b> March 8, 2020 2:45 PM<br>
<b>To:</b> Clemens Eisserer &lt;linuxhippy@gmail.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: Possibility of RX570 responsible for spontaneous reboot=
s (MCE) with Ryzen 3700x?</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<p style=3D"margin-top: 0px; margin-bottom: 0px;font-family:Arial; font-siz=
e:10pt; color:#0078D7; margin:15pt" align=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
The decoded MCE info doesn't look right... if the last bit is a zero I beli=
eve that means the watchdog timer is not enabled.&nbsp;
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
That said, I'm not sure how the decoder you found works, but it seems like =
a bit more information would be required than what you passed in. Can you p=
oint me to the program you used ?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
John<br>
</div>
<div>
<div id=3D"x_appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Clemens Eisserer &lt;linuxh=
ippy@gmail.com&gt;<br>
<b>Sent:</b> March 8, 2020 9:06 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> Possibility of RX570 responsible for spontaneous reboots (M=
CE) with Ryzen 3700x?</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hi there,<br>
<br>
Right after Ryzen3xxx was available I built a new system consisting of:<br>
- Asrock Phantom Gaming 4 X570 (latest BIOS 2.3)<br>
- Ryzen 3700x (not overclocked)<br>
- MSI RX570 4GB<br>
- Larger CPU cooler, high quality PSU, etc...<br>
<br>
The system runs stable with Windows-10 (no reboot BSOD in months) and<br>
runs memtest86 (single/multicore) as well as various load-tests for<br>
hours without errors. However running Linux I get a spontaneous reboot<br>
every now and then (2-3x a week), with always the same machine check<br>
exception logged:<br>
<br>
[&nbsp;&nbsp;&nbsp; 0.105003] .... node&nbsp; #0, CPUs:&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; #1&nbsp; #2<br>
[&nbsp;&nbsp;&nbsp; 0.107022] mce: [Hardware Error]: Machine check events l=
ogged<br>
[&nbsp;&nbsp;&nbsp; 0.107023] mce: [Hardware Error]: CPU 2: Machine Check: =
0 Bank 5:<br>
bea0000000000108<br>
[&nbsp;&nbsp;&nbsp; 0.107092] mce: [Hardware Error]: TSC 0 ADDR 7f80a0c0181=
a MISC<br>
d012000100000000 SYND 4d000000 IPID 500b000000000<br>
[&nbsp;&nbsp;&nbsp; 0.107167] mce: [Hardware Error]: PROCESSOR 2:870f10 TIM=
E<br>
1580717835 SOCKET 0 APIC 4 microcode 8701013<br>
<br>
I've tried a lot of different CPU-related things, like disabling C6,<br>
disabling MWAIT use for task switching, etc without success.<br>
I tried two times to contact AMD support only asking them to please<br>
decode the MCE hex value - but as soon as they read over the term<br>
&quot;linux&quot; the basically abort any communication. And to be honest, =
I had<br>
the impression that they did not actually know what an MCE is in the<br>
first place.<br>
<br>
Luckily I found a decoder on github which prints:<br>
Bank: Execution Unit (EX)<br>
Error: Watchdog Timeout error (WDT 0x0)<br>
<br>
I was rather hopeless until I found the following reddit thread:<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.reddit.com%2Fr%2Farchlinux%2Fcomments%2Fe33nyg%2Fhard_reboots_with_=
ryzen_3600x%2F&amp;data=3D02%7C01%7Cjohn.bridgman%40amd.com%7Ca20457c936164=
8485aeb08d7c390d88a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6371928999=
11911960&amp;sdata=3DARxvLcwPrVQkP%2Bil%2FvKz9mKZOBd5Sx%2Bg0MOlQ%2F8UmIs%3D=
&amp;reserved=3D0" originalsrc=3D"https://www.reddit.com/r/archlinux/commen=
ts/e33nyg/hard_reboots_with_ryzen_3600x/" shash=3D"V/vXiXgOXUANzSb33n3PMl4a=
6yDdY0rxO0q5j3NaOsfU9/&#43;OOggu8DXDjPfuY41eA7MipV1ai4RFw1kujKPzeAoy2k1caHZ=
VWoh3f7KI1IrV7JSsfixLCUGmFLziBQaVtMugut7pBkuhRrWhSGX90OOjey/1fAtcAWceElUv4g=
g=3D">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.reddit.com%2Fr%2Farchlinux%2Fcomments%2Fe33nyg%2Fhard_reboots_with_ryzen=
_3600x%2F&amp;amp;data=3D02%7C01%7Cjohn.bridgman%40amd.com%7C683b51328ba147=
1c113c08d7c3619d90%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63719269711=
1254592&amp;amp;sdata=3D4TuB0a0VHxTqd8R0xLwxg%2BOv1vu8C7L%2FLW4O0EOiq1I%3D&=
amp;amp;reserved=3D0</a><br>
what the decoder logic is <br>
The users there claim to experience exactly the same problem (even<br>
with the same MCE-Code logged) but where using R600 based graphics<br>
cards - he is even using the same mainboard. When he swapped his<br>
R600-card with a new RX5700 the problems vanished.<br>
<br>
I don't have the luxury to simply try another GPU (my RX5700 is the<br>
only one properly driving my 4k@60Hz panel), however the whole<br>
observation makes me wonder. How can a GPU be responsible for<br>
low-level errors such as the machine check exception in the execution<br>
units like the one mentioned above.<br>
Could DMA transfers gone bad be the cluprit?<br>
Are there any &quot;safe mode&quot; options available I could try regarding=
<br>
amdgpu (I tried disabling low-power states but this didn't help and<br>
only made my GPU fans spin up)?<br>
<br>
Any help is highly appreciated.<br>
<br>
Thanks, Clemens<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01=
%7Cjohn.bridgman%40amd.com%7Ca20457c9361648485aeb08d7c390d88a%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637192899911921953&amp;sdata=3DzuBIsSmJqDSR=
5pg4mcjcYlRypl65g4EJoLhgjzD20rk%3D&amp;reserved=3D0" originalsrc=3D"https:/=
/lists.freedesktop.org/mailman/listinfo/amd-gfx" shash=3D"HLUr0pT7Bb4&#43;H=
p///4hMO5&#43;f0IUBlSc5nfArDSo95AyHDghp8jpwkYi6jOuobncTpG7kUXPl6KxGpkxNzY4I=
fM9H3iunNY1Lu8eKHFJ7XPPPEgvSnyMsBSVZRfH0CnTs4B&#43;sYwxvt8/xIFdqbZ/SyalGctZ=
OVkMoj/ymxv1ClzU=3D">https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;=
data=3D02%7C01%7Cjohn.bridgman%40amd.com%7C683b51328ba1471c113c08d7c3619d90=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637192697111264585&amp;amp;sd=
ata=3DL52zHeIm8GzEr5eYjUDm5bPK4U1DF0t1GtaxaUy9qHY%3D&amp;amp;reserved=3D0</=
a><br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB309791830A01031827FE2DCAE8E10DM6PR12MB3097namp_--

--===============0093581751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0093581751==--
